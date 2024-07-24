import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobile_attendance_test/constants/local_constants.dart';

class LocalStorageHelper {
  static init() async {
    await Hive.initFlutter();
    await _openBoxes();
  }

  static _openBoxes() async {
    await Hive.openBox(LocalConstants.appSettingBox);
    await Hive.openBox(LocalConstants.attendancesBox);
  }

  static Box<T> getBox<T>(String name) {
    return Hive.box<T>(name);
  }
}
