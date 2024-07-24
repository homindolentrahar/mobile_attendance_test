import 'package:geocoding/geocoding.dart';

extension PlacemarkExt on Placemark {
  String toReadableAddress() {
    return "${street ?? "-"}, ${subLocality ?? "-"}, ${locality ?? "-"}, ${administrativeArea ?? "-"}, ${country ?? "-"}";
  }
}
