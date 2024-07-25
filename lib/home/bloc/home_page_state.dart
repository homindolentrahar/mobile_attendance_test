import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState({
    @Default(0.0) double langitude,
    @Default(0.0) double longitude,
    LatLng? currentLocation,
    @Default(false) bool isMasterLocationSet,
  }) = _HomePageState;
}
