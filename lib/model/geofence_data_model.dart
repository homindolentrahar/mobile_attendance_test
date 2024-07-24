class GeofenceDataModel {
  final String id;
  final double latitude;
  final double longitude;
  final List<GeofenceDataRadiusModel> radius;
  final dynamic data;

  GeofenceDataModel({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.radius,
    this.data,
  });
}

class GeofenceDataRadiusModel {
  final String id;
  final double radius;
  final dynamic data;

  GeofenceDataRadiusModel({
    required this.id,
    required this.radius,
    this.data,
  });
}
