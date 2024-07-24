import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  factory HomePageState({
    @Default(0.0) double langitude,
    @Default(0.0) double longitude,
  }) = _HomePageState;
}
