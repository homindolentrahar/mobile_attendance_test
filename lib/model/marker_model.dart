import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerModel {
  final String markerId;
  final LatLng position;

  MarkerModel({
    required this.markerId,
    required this.position,
  });
}
