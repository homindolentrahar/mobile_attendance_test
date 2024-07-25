import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding_platform_interface/src/models/placemark.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/constants/app_constants.dart';
import 'package:mobile_attendance_test/home/bloc/map_viewer_cubit.dart';
import 'package:mobile_attendance_test/home/bloc/map_viewer_state.dart';
import 'package:mobile_attendance_test/location/bloc/master_location_bloc.dart';
import 'package:mobile_attendance_test/location/bloc/master_location_state.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';
import 'package:mobile_attendance_test/utils/extensions/location_extensions.dart';

class MasterLocationPage extends StatelessWidget {
  const MasterLocationPage._();

  static Widget getPage() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MasterLocationCubit>(
          create: (_) => MasterLocationCubit(),
        ),
      ],
      child: const MasterLocationPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Set Master Location",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<MapViewerCubit, MapViewerState>(
              builder: (_, state) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: state.currentLocation ??
                          LatLng(
                            state.masterLocation?.latitude ?? 0,
                            state.masterLocation?.longitude ?? 0,
                          ),
                      zoom: 17,
                    ),
                    markers: state.markers
                        .map(
                          (marker) => Marker(
                            markerId: MarkerId(marker.markerId),
                            position: marker.position,
                            icon:
                                marker.markerId == AppConstants.currentLocation
                                    ? BitmapDescriptor.defaultMarkerWithHue(
                                        BitmapDescriptor.hueAzure,
                                      )
                                    : BitmapDescriptor.defaultMarker,
                            onTap: () {},
                          ),
                        )
                        .toSet(),
                    polylines: {
                      Polyline(
                        polylineId: const PolylineId("master_route"),
                        color: Theme.of(context).colorScheme.primary,
                        points: state.polylineCoordinates,
                      )
                    },
                    circles: {
                      Circle(
                        circleId: const CircleId(
                          AppConstants.masterGeofenceArea,
                        ),
                        center: state.masterLocation ?? const LatLng(0, 0),
                        fillColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.35),
                        radius: 50,
                        strokeColor: Colors.transparent,
                        strokeWidth: 0,
                      )
                    },
                    onTap: (position) {
                      context.read<MapViewerCubit>().setMarkerOnTap(
                            AppConstants.masterLocation,
                            LatLng(
                              position.latitude,
                              position.longitude,
                            ),
                          );

                      context
                          .read<MapViewerCubit>()
                          .saveMasterLocation(position);

                      context.read<MasterLocationCubit>().refreshData();
                    },
                    onMapCreated: (GoogleMapController controller) {
                      context.read<MapViewerCubit>().mapController = controller;
                    },
                  ),
                );
              },
            ),
            Expanded(
              child: DefaultTabController(
                initialIndex: 0,
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      tabs: ["Current Location", "Master Location"]
                          .map(
                            (e) => Tab(
                              child: Text(
                                e,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    Expanded(
                      child:
                          BlocBuilder<MasterLocationCubit, MasterLocationState>(
                              builder: (_, state) {
                        if (state.status == BaseStatus.loading ||
                            state.status == BaseStatus.initial) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state.status == BaseStatus.error) {
                          return const Center(
                            child: Text("Failed to get location"),
                          );
                        }

                        return TabBarView(
                          children: [
                            _LocationFragment(
                              title: "Current Location",
                              position: state.currentLocation,
                              address: state.currentAddress,
                              bloc: context.read<MasterLocationCubit>(),
                            ),
                            _LocationFragment(
                              title: "Master Location",
                              position: state.masterLocation,
                              address: state.masterAddress,
                              bloc: context.read<MasterLocationCubit>(),
                            )
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LocationFragment extends StatelessWidget {
  final String title;
  final MasterLocationCubit bloc;
  final Placemark? address;
  final LatLng? position;

  const _LocationFragment({
    required this.title,
    required this.bloc,
    this.address,
    this.position,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      address?.toReadableAddress() ?? "-",
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {
                  // Go to the location
                },
                icon: const Icon(Icons.map_outlined),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
