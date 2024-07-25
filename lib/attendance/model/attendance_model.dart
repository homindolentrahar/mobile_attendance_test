import 'dart:typed_data';

class AttendanceModel {
  final String id;
  final Uint8List image;
  final String? description;
  final double latitude;
  final double longitude;
  final String address;
  final DateTime timestamp;

  AttendanceModel({
    required this.id,
    required this.image,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.timestamp,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
      id: json['id'],
      image: json['image'],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'address': address,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
