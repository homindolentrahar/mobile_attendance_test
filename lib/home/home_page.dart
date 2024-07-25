import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geofence_service/geofence_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_attendance_test/attendance/create_attendance_page.dart';
import 'package:mobile_attendance_test/constants/app_constants.dart';
import 'package:mobile_attendance_test/home/bloc/home_page_cubit.dart';
import 'package:mobile_attendance_test/home/bloc/home_page_state.dart';
import 'package:mobile_attendance_test/home/bloc/map_viewer_cubit.dart';
import 'package:mobile_attendance_test/home/bloc/map_viewer_state.dart';
import 'package:mobile_attendance_test/location/master_location_page.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';
import 'package:mobile_attendance_test/utils/extensions/date_extensions.dart';
import 'package:mobile_attendance_test/utils/geofence_helper.dart';

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
      floatingActionButton: StreamBuilder(
          stream: GeofenceHelper().geofenceStreamController.stream,
          builder: (_, snapshot) {
            log("Snapshot: ${snapshot.data?.status}");

            if (snapshot.data?.status == GeofenceStatus.ENTER) {
              return FloatingActionButton(
                backgroundColor: Theme.of(context).primaryColor,
                shape: const CircleBorder(),
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: () async {
                  final bool? isAdd = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => CreateAttendancePage.getPage(),
                    ),
                  );

                  log("isAdd: $isAdd");

                  if (isAdd != null && isAdd) {
                    if (context.mounted) {
                      context.read<HomePageCubit>().getAttendanceList();
                    }
                  }
                },
              );
            }

            return const FloatingActionButton.extended(
              elevation: 0,
              disabledElevation: 0,
              onPressed: null,
              label: Text("Not in attendance area"),
            );
          }),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<MapViewerCubit, MapViewerState>(
                  builder: (_, state) {
                    return state.masterLocation != null
                        ? Builder(
                            builder: (_) {
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
                                      onTap: (position) {},
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
                Expanded(
                  child: BlocBuilder<HomePageCubit, HomePageState>(
                      builder: (_, state) {
                    if (state.status == BaseStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.status == BaseStatus.success) {
                      return ListView.separated(
                        itemCount: state.attendances.length,
                        separatorBuilder: (_, index) => const Divider(),
                        itemBuilder: (_, index) {
                          final attendance = state.attendances[index];

                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              attendance.timestamp.toFormattedString(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Text(
                              "(${attendance.latitude}, ${attendance.longitude})\n${attendance.address}",
                              style: TextStyle(
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.outline,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CreateAttendancePage.getPage(
                                    initialData: attendance,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }

                    return const Center(
                      child: Text("No Attendance data yet!"),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
