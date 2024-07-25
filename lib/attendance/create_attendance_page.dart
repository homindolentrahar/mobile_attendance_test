import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_attendance_test/attendance/bloc/create_attendance_cubit.dart';
import 'package:mobile_attendance_test/attendance/bloc/create_attendance_state.dart';
import 'package:mobile_attendance_test/attendance/model/attendance_model.dart';
import 'package:mobile_attendance_test/utils/base_status.dart';
import 'package:mobile_attendance_test/utils/extensions/date_extensions.dart';

class CreateAttendancePage extends StatelessWidget {
  const CreateAttendancePage._();

  static Widget getPage({AttendanceModel? initialData}) {
    return BlocProvider<CreateAttendanceCubit>(
      create: (_) => CreateAttendanceCubit(data: initialData),
      child: const CreateAttendancePage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateAttendanceCubit, CreateAttendanceState>(
      listener: (_, state) {
        if (state.status == BaseStatus.created) {
          Navigator.of(context).pop(true);
        }
      },
      child: Scaffold(
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
              key: context.read<CreateAttendanceCubit>().formKey,
              child: BlocBuilder<CreateAttendanceCubit, CreateAttendanceState>(
                  builder: (_, state) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Builder(
                      builder: (_) {
                        if (state.status == BaseStatus.loading) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Theme.of(context).colorScheme.surface,
                            ),
                          );
                        }

                        return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            _ImagePickerWidget(
                              isEnable: !state.isEdit,
                              imageData: context
                                  .read<CreateAttendanceCubit>()
                                  .state
                                  .image,
                              name: "image",
                              onImagePicked: (value) {
                                context
                                    .read<CreateAttendanceCubit>()
                                    .getLocationTag(value);
                              },
                            ),
                            state.status == BaseStatus.success
                                ? Container(
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
                                                    pattern:
                                                        "EEE, dd MMMM yyyy",
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
                                                    pattern: "HH:mm:ss",
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
                                          state.address ?? "-",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      controller:
                          context.read<CreateAttendanceCubit>().descController,
                      enabled: !state.isEdit,
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
                    !state.isEdit
                        ? MaterialButton(
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
                              context
                                  .read<CreateAttendanceCubit>()
                                  .createAttendance();
                            },
                            child: const Text("Create Attendance"),
                          )
                        : const SizedBox.shrink(),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _ImagePickerWidget extends StatefulWidget {
  const _ImagePickerWidget({
    required this.name,
    this.imageData,
    required this.onImagePicked,
    this.isEnable = true,
  });

  final String name;
  final bool isEnable;
  final Uint8List? imageData;
  final ValueChanged<Uint8List?> onImagePicked;

  @override
  State<_ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<_ImagePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return FormBuilderField<Uint8List?>(
      name: widget.name,
      initialValue: widget.imageData,
      validator: FormBuilderValidators.required(),
      onChanged: (value) {
        widget.onImagePicked(value);
      },
      builder: (field) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.45,
              child: Builder(
                builder: (_) {
                  return field.value != null
                      ? GestureDetector(
                          onTap: widget.isEnable
                              ? () async {
                                  final XFile? image =
                                      await ImagePicker().pickImage(
                                    source: ImageSource.camera,
                                    imageQuality: 80,
                                    preferredCameraDevice: CameraDevice.front,
                                  );

                                  if (image != null) {
                                    field.didChange(await image.readAsBytes());
                                  }
                                }
                              : null,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              field.value!,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : Material(
                          color: Theme.of(context).colorScheme.surface,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.3,
                              color:
                                  Theme.of(context).colorScheme.outlineVariant,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: widget.isEnable
                                ? () async {
                                    final XFile? image =
                                        await ImagePicker().pickImage(
                                      source: ImageSource.camera,
                                      imageQuality: 80,
                                      preferredCameraDevice: CameraDevice.front,
                                    );

                                    if (image != null) {
                                      field
                                          .didChange(await image.readAsBytes());
                                    }
                                  }
                                : null,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 32,
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  "Take Photo",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        Theme.of(context).colorScheme.outline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                },
              ),
            ),
            if (field.hasError) ...[
              const SizedBox(height: 8),
              Text(
                field.errorText ?? "",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
