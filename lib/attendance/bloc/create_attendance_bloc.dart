import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_attendance_test/attendance/bloc/create_attendance_state.dart';

class CreateAttendanceBloc extends Cubit<CreateAttendanceState> {
  final formKey = GlobalKey<FormBuilderState>();

  CreateAttendanceBloc() : super(const CreateAttendanceState()) {
    _checkIsLocationValid();
  }

  Future<void> _checkIsLocationValid() async {
    const isLocationValid = true;

    if (!isLocationValid) {
      // Go back
      return;
    }
  }

  Future<void> takePhoto() async {
    final XFile? image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      preferredCameraDevice: CameraDevice.front,
    );

    if (image != null) {
      // Emit the image to UI
      emit(state.copyWith(
        image: image,
      ));
    }
  }

  Future<void> createAttendance() async {}
}
