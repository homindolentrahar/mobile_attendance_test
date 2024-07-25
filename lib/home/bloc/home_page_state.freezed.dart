// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomePageState {
  double get langitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  LatLng? get currentLocation => throw _privateConstructorUsedError;
  bool get isMasterLocationSet => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomePageStateCopyWith<HomePageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res, HomePageState>;
  @useResult
  $Res call(
      {double langitude,
      double longitude,
      LatLng? currentLocation,
      bool isMasterLocationSet});
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res, $Val extends HomePageState>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? langitude = null,
    Object? longitude = null,
    Object? currentLocation = freezed,
    Object? isMasterLocationSet = null,
  }) {
    return _then(_value.copyWith(
      langitude: null == langitude
          ? _value.langitude
          : langitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      isMasterLocationSet: null == isMasterLocationSet
          ? _value.isMasterLocationSet
          : isMasterLocationSet // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomePageStateImplCopyWith<$Res>
    implements $HomePageStateCopyWith<$Res> {
  factory _$$HomePageStateImplCopyWith(
          _$HomePageStateImpl value, $Res Function(_$HomePageStateImpl) then) =
      __$$HomePageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double langitude,
      double longitude,
      LatLng? currentLocation,
      bool isMasterLocationSet});
}

/// @nodoc
class __$$HomePageStateImplCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res, _$HomePageStateImpl>
    implements _$$HomePageStateImplCopyWith<$Res> {
  __$$HomePageStateImplCopyWithImpl(
      _$HomePageStateImpl _value, $Res Function(_$HomePageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? langitude = null,
    Object? longitude = null,
    Object? currentLocation = freezed,
    Object? isMasterLocationSet = null,
  }) {
    return _then(_$HomePageStateImpl(
      langitude: null == langitude
          ? _value.langitude
          : langitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      isMasterLocationSet: null == isMasterLocationSet
          ? _value.isMasterLocationSet
          : isMasterLocationSet // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomePageStateImpl implements _HomePageState {
  _$HomePageStateImpl(
      {this.langitude = 0.0,
      this.longitude = 0.0,
      this.currentLocation,
      this.isMasterLocationSet = false});

  @override
  @JsonKey()
  final double langitude;
  @override
  @JsonKey()
  final double longitude;
  @override
  final LatLng? currentLocation;
  @override
  @JsonKey()
  final bool isMasterLocationSet;

  @override
  String toString() {
    return 'HomePageState(langitude: $langitude, longitude: $longitude, currentLocation: $currentLocation, isMasterLocationSet: $isMasterLocationSet)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomePageStateImpl &&
            (identical(other.langitude, langitude) ||
                other.langitude == langitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.isMasterLocationSet, isMasterLocationSet) ||
                other.isMasterLocationSet == isMasterLocationSet));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, langitude, longitude, currentLocation, isMasterLocationSet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      __$$HomePageStateImplCopyWithImpl<_$HomePageStateImpl>(this, _$identity);
}

abstract class _HomePageState implements HomePageState {
  factory _HomePageState(
      {final double langitude,
      final double longitude,
      final LatLng? currentLocation,
      final bool isMasterLocationSet}) = _$HomePageStateImpl;

  @override
  double get langitude;
  @override
  double get longitude;
  @override
  LatLng? get currentLocation;
  @override
  bool get isMasterLocationSet;
  @override
  @JsonKey(ignore: true)
  _$$HomePageStateImplCopyWith<_$HomePageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
