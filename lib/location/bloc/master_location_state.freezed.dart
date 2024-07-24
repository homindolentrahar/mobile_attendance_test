// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_location_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MasterLocationState {
  BaseStatus get status => throw _privateConstructorUsedError;
  LatLng? get masterLocation => throw _privateConstructorUsedError;
  LatLng? get currentLocation => throw _privateConstructorUsedError;
  Placemark? get masterAddress => throw _privateConstructorUsedError;
  Placemark? get currentAddress => throw _privateConstructorUsedError;
  List<MarkerModel> get markers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MasterLocationStateCopyWith<MasterLocationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterLocationStateCopyWith<$Res> {
  factory $MasterLocationStateCopyWith(
          MasterLocationState value, $Res Function(MasterLocationState) then) =
      _$MasterLocationStateCopyWithImpl<$Res, MasterLocationState>;
  @useResult
  $Res call(
      {BaseStatus status,
      LatLng? masterLocation,
      LatLng? currentLocation,
      Placemark? masterAddress,
      Placemark? currentAddress,
      List<MarkerModel> markers});
}

/// @nodoc
class _$MasterLocationStateCopyWithImpl<$Res, $Val extends MasterLocationState>
    implements $MasterLocationStateCopyWith<$Res> {
  _$MasterLocationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? masterLocation = freezed,
    Object? currentLocation = freezed,
    Object? masterAddress = freezed,
    Object? currentAddress = freezed,
    Object? markers = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus,
      masterLocation: freezed == masterLocation
          ? _value.masterLocation
          : masterLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      masterAddress: freezed == masterAddress
          ? _value.masterAddress
          : masterAddress // ignore: cast_nullable_to_non_nullable
              as Placemark?,
      currentAddress: freezed == currentAddress
          ? _value.currentAddress
          : currentAddress // ignore: cast_nullable_to_non_nullable
              as Placemark?,
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<MarkerModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasterLocationStateImplCopyWith<$Res>
    implements $MasterLocationStateCopyWith<$Res> {
  factory _$$MasterLocationStateImplCopyWith(_$MasterLocationStateImpl value,
          $Res Function(_$MasterLocationStateImpl) then) =
      __$$MasterLocationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus status,
      LatLng? masterLocation,
      LatLng? currentLocation,
      Placemark? masterAddress,
      Placemark? currentAddress,
      List<MarkerModel> markers});
}

/// @nodoc
class __$$MasterLocationStateImplCopyWithImpl<$Res>
    extends _$MasterLocationStateCopyWithImpl<$Res, _$MasterLocationStateImpl>
    implements _$$MasterLocationStateImplCopyWith<$Res> {
  __$$MasterLocationStateImplCopyWithImpl(_$MasterLocationStateImpl _value,
      $Res Function(_$MasterLocationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? masterLocation = freezed,
    Object? currentLocation = freezed,
    Object? masterAddress = freezed,
    Object? currentAddress = freezed,
    Object? markers = null,
  }) {
    return _then(_$MasterLocationStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus,
      masterLocation: freezed == masterLocation
          ? _value.masterLocation
          : masterLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
      masterAddress: freezed == masterAddress
          ? _value.masterAddress
          : masterAddress // ignore: cast_nullable_to_non_nullable
              as Placemark?,
      currentAddress: freezed == currentAddress
          ? _value.currentAddress
          : currentAddress // ignore: cast_nullable_to_non_nullable
              as Placemark?,
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<MarkerModel>,
    ));
  }
}

/// @nodoc

class _$MasterLocationStateImpl implements _MasterLocationState {
  _$MasterLocationStateImpl(
      {this.status = BaseStatus.initial,
      this.masterLocation,
      this.currentLocation,
      this.masterAddress,
      this.currentAddress,
      final List<MarkerModel> markers = const []})
      : _markers = markers;

  @override
  @JsonKey()
  final BaseStatus status;
  @override
  final LatLng? masterLocation;
  @override
  final LatLng? currentLocation;
  @override
  final Placemark? masterAddress;
  @override
  final Placemark? currentAddress;
  final List<MarkerModel> _markers;
  @override
  @JsonKey()
  List<MarkerModel> get markers {
    if (_markers is EqualUnmodifiableListView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markers);
  }

  @override
  String toString() {
    return 'MasterLocationState(status: $status, masterLocation: $masterLocation, currentLocation: $currentLocation, masterAddress: $masterAddress, currentAddress: $currentAddress, markers: $markers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasterLocationStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.masterLocation, masterLocation) ||
                other.masterLocation == masterLocation) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.masterAddress, masterAddress) ||
                other.masterAddress == masterAddress) &&
            (identical(other.currentAddress, currentAddress) ||
                other.currentAddress == currentAddress) &&
            const DeepCollectionEquality().equals(other._markers, _markers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      masterLocation,
      currentLocation,
      masterAddress,
      currentAddress,
      const DeepCollectionEquality().hash(_markers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MasterLocationStateImplCopyWith<_$MasterLocationStateImpl> get copyWith =>
      __$$MasterLocationStateImplCopyWithImpl<_$MasterLocationStateImpl>(
          this, _$identity);
}

abstract class _MasterLocationState implements MasterLocationState {
  factory _MasterLocationState(
      {final BaseStatus status,
      final LatLng? masterLocation,
      final LatLng? currentLocation,
      final Placemark? masterAddress,
      final Placemark? currentAddress,
      final List<MarkerModel> markers}) = _$MasterLocationStateImpl;

  @override
  BaseStatus get status;
  @override
  LatLng? get masterLocation;
  @override
  LatLng? get currentLocation;
  @override
  Placemark? get masterAddress;
  @override
  Placemark? get currentAddress;
  @override
  List<MarkerModel> get markers;
  @override
  @JsonKey(ignore: true)
  _$$MasterLocationStateImplCopyWith<_$MasterLocationStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
