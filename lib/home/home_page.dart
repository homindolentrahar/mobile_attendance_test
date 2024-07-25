import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/attendance/create_attendance_page.dart';
import 'package:mobile_attendance_test/constants/app_constants.dart';
import 'package:mobile_attendance_test/home/bloc/home_page_cubit.dart';
import 'package:mobile_attendance_test/home/bloc/home_page_state.dart';
import 'package:mobile_attendance_test/home/bloc/map_viewer_cubit.dart';
import 'package:mobile_attendance_test/home/bloc/map_viewer_state.dart';
import 'package:mobile_attendance_test/location/master_location_page.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';

class HomePage extends StatelessWidget {
  const HomePage._();

  static Widget getPage() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => HomePageCubit(),
        ),
      ],
      child: const HomePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Attendance"),
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MasterLocationPage.getPage(),
                ),
              );
            },
            icon: const Icon(Icons.map_outlined),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        shape: const CircleBorder(),
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CreateAttendancePage.getPage(),
            ),
          );
        },
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<HomePageCubit, HomePageState>(
                  builder: (_, homeState) {
                    return homeState.isMasterLocationSet
                        ? BlocBuilder<MapViewerCubit, MapViewerState>(
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

                              return Column(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: GoogleMap(
                                      initialCameraPosition: CameraPosition(
                                        target: state.currentLocation ??
                                            LatLng(
                                              state.masterLocation?.latitude ??
                                                  0,
                                              state.masterLocation?.longitude ??
                                                  0,
                                            ),
                                        zoom: 17,
                                      ),
                                      markers: state.markers
                                          .map(
                                            (marker) => Marker(
                                              markerId:
                                                  MarkerId(marker.markerId),
                                              position: marker.position,
                                              icon: marker.markerId ==
                                                      AppConstants
                                                          .currentLocation
                                                  ? BitmapDescriptor
                                                      .defaultMarkerWithHue(
                                                      BitmapDescriptor.hueAzure,
                                                    )
                                                  : BitmapDescriptor
                                                      .defaultMarker,
                                              onTap: () {},
                                            ),
                                          )
                                          .toSet(),
                                      polylines: {
                                        Polyline(
                                          polylineId:
                                              const PolylineId("master_route"),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          points: state.polylineCoordinates,
                                        )
                                      },
                                      circles: {
                                        Circle(
                                          circleId: const CircleId(
                                            AppConstants.masterGeofenceArea,
                                          ),
                                          center: state.masterLocation ??
                                              const LatLng(0, 0),
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
                                        // context
                                        //     .read<MapViewerCubit>()
                                        //     .setMarkerOnTap(
                                        //       AppConstants.masterLocation,
                                        //       LatLng(
                                        //         position.latitude,
                                        //         position.longitude,
                                        //       ),
                                        //     );

                                        // context
                                        //     .read<MapViewerCubit>()
                                        //     .saveMasterLocation(position);
                                      },
                                      onMapCreated:
                                          (GoogleMapController controller) {
                                        context
                                            .read<MapViewerCubit>()
                                            .mapController = controller;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Set master location by clicking the map icon on the top right corner",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.warning_rounded),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Master Location not set yet!",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Set master location by clicking the map icon on the top right corner",
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                  },
                ),
                const SizedBox(height: 16),
                const Expanded(
                  child: Center(
                    child: Text("No Attendance data yet!"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
