import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_attendance_test/core/bloc/location_cubit.dart';
import 'package:mobile_attendance_test/home/home_page.dart';
import 'package:mobile_attendance_test/utils/local_storage_helper.dart';

void main() async {
  LocalStorageHelper.init();

  runApp(const AttendanceTest());
}

class AttendanceTest extends StatelessWidget {
  const AttendanceTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationCubit>(
      lazy: false,
      create: (_) => LocationCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Attendance Test',
        home: HomePage.getPage(),
      ),
    );
  }
}
