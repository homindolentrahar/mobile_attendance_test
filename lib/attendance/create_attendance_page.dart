import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobile_attendance_test/attendance/bloc/create_attendance_bloc.dart';
import 'package:mobile_attendance_test/attendance/bloc/create_attendance_state.dart';

class CreateAttendancePage extends StatelessWidget {
  const CreateAttendancePage._();

  static Widget getPage() {
    return BlocProvider<CreateAttendanceBloc>(
      create: (_) => CreateAttendanceBloc(),
      child: const CreateAttendancePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MaterialButton(
        color: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        onPressed: () {
          context.read<CreateAttendanceBloc>().createAttendance();
        },
        child: const Text("Create Attendance"),
      ),
      body: SafeArea(
        child: BlocBuilder<CreateAttendanceBloc, CreateAttendanceState>(
            builder: (ctx, state) {
          return FormBuilder(
            key: ctx.read<CreateAttendanceBloc>().formKey,
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.outline,
                      width: 1.3,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        size: 32,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Take Photo",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
