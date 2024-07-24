import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobile_attendance_test/attendance/bloc/create_attendance_bloc.dart';
import 'package:mobile_attendance_test/attendance/bloc/create_attendance_state.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';
import 'package:mobile_attendance_test/utils/extensions/date_extensions.dart';
import 'package:mobile_attendance_test/utils/extensions/location_extensions.dart';

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
      appBar: AppBar(
        title: const Text(
          "Create Attendance",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: FormBuilder(
            key: context.read<CreateAttendanceBloc>().formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 360,
                  child:
                      BlocBuilder<CreateAttendanceBloc, CreateAttendanceState>(
                    builder: (ctx, state) {
                      if (state.status == BaseStatus.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return state.image != null
                          ? Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.memory(
                                    state.image!,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.75),
                                    borderRadius: const BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            state.attendanceAt
                                                    ?.toFormattedString(
                                                  pattern: "EEE, dd MMMM yyyy",
                                                ) ??
                                                "-",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                          ),
                                          Text(
                                            state.attendanceAt
                                                    ?.toFormattedString(
                                                  pattern: "HH:mm",
                                                ) ??
                                                "-",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onPrimary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "(${state.position?.latitude ?? "-"}, ${state.position?.longitude ?? "-"})",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        state.address?.toReadableAddress() ??
                                            "-",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Material(
                              color: Theme.of(context).colorScheme.surface,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1.3,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outlineVariant,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  context
                                      .read<CreateAttendanceBloc>()
                                      .takePhoto();
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      size: 32,
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "Take Photo",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .outline,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                FormBuilderTextField(
                  name: "desc",
                  minLines: 3,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: "Description (Optional)",
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    hintText: "Tell us more about this attendance",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  elevation: 0,
                  focusElevation: 0,
                  highlightElevation: 0,
                  textColor: Theme.of(context).colorScheme.onPrimary,
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
