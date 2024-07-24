import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/constants/app_constants.dart';
import 'package:mobile_attendance_test/location/bloc/master_location_bloc.dart';
import 'package:mobile_attendance_test/location/bloc/master_location_state.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';

class MasterLocationPage extends StatelessWidget {
  const MasterLocationPage._();

  static Widget getPage() {
    return BlocProvider<MasterLocationCubit>(
      create: (_) => MasterLocationCubit(),
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
        actions: [
          IconButton(
            onPressed: () {
              context.read<MasterLocationCubit>().refreshData();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<MasterLocationCubit, MasterLocationState>(
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
                height: MediaQuery.of(context).size.height * 0.5,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      state.masterLocation?.latitude ??
                          state.currentLocation?.latitude ??
                          0.0,
                      state.masterLocation?.longitude ??
                          state.currentLocation?.longitude ??
                          0.0,
                    ),
                    zoom: 16,
                  ),
                  onTap: (postion) {
                    context
                        .read<MasterLocationCubit>()
                        .setMarkerOnTap("master_location", postion);
                  },
                  markers: state.markers
                      .map(
                        (marker) => Marker(
                          markerId: MarkerId(marker.markerId),
                          position: marker.position,
                          onTap: () {
                            if (marker.markerId ==
                                AppConstants.masterLocation) {
                              if (context
                                  .read<MasterLocationCubit>()
                                  .checkIsMasterLocationSame(marker.position)) {
                                return;
                              }

                              showDialog(
                                context: context,
                                builder: (builderCtx) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  title: const Text(
                                    "Master Location",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  content: const Text(
                                    "Are you sure want to set this location as a Master Location?",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Cancel"),
                                    ),
                                    MaterialButton(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      textColor: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                      elevation: 0,
                                      focusElevation: 0,
                                      highlightElevation: 0,
                                      shape: const StadiumBorder(),
                                      onPressed: () {
                                        context
                                            .read<MasterLocationCubit>()
                                            .saveMasterLocation(
                                                marker.position);
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Confirm"),
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      )
                      .toSet(),
                  onMapCreated: (GoogleMapController controller) {
                    context.read<MasterLocationCubit>().mapController =
                        controller;
                  },
                ),
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
                        child: TabBarView(
                          children: ["Current", "Master"]
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
