import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_state.freezed.dart';

@freezed
class LocationState with _$LocationState {
  factory LocationState({
    @Default(0.0) double langitude,
    @Default(0.0) double longitude,
  }) = _LocationState;
}
