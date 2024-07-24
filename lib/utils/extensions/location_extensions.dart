import 'package:google_maps_flutter/google_maps_flutter.dart';

extension LatLngExtension on LatLng {
  static LatLng? fromMap(Map<String, dynamic> map) {
    if (map['latitude'] == null || map['longitude'] == null) {
      return null;
    }
    return LatLng(map['latitude'], map['longitude']);
  }
}
