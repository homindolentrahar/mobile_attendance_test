// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_viewer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapViewerState {
  BaseStatus get status => throw _privateConstructorUsedError;
  LatLng? get masterLocation => throw _privateConstructorUsedError;
  LatLng? get currentLocation => throw _privateConstructorUsedError;
  List<MarkerModel> get markers => throw _privateConstructorUsedError;
  List<LatLng> get polylineCoordinates => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapViewerStateCopyWith<MapViewerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapViewerStateCopyWith<$Res> {
  factory $MapViewerStateCopyWith(
          MapViewerState value, $Res Function(MapViewerState) then) =
      _$MapViewerStateCopyWithImpl<$Res, MapViewerState>;
  @useResult
  $Res call(
      {BaseStatus status,
      LatLng? masterLocation,
      LatLng? currentLocation,
      List<MarkerModel> markers,
      List<LatLng> polylineCoordinates});
}

/// @nodoc
class _$MapViewerStateCopyWithImpl<$Res, $Val extends MapViewerState>
    implements $MapViewerStateCopyWith<$Res> {
  _$MapViewerStateCopyWithImpl(this._value, this._then);

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
    Object? markers = null,
    Object? polylineCoordinates = null,
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
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<MarkerModel>,
      polylineCoordinates: null == polylineCoordinates
          ? _value.polylineCoordinates
          : polylineCoordinates // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapViewerStateImplCopyWith<$Res>
    implements $MapViewerStateCopyWith<$Res> {
  factory _$$MapViewerStateImplCopyWith(_$MapViewerStateImpl value,
          $Res Function(_$MapViewerStateImpl) then) =
      __$$MapViewerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus status,
      LatLng? masterLocation,
      LatLng? currentLocation,
      List<MarkerModel> markers,
      List<LatLng> polylineCoordinates});
}

/// @nodoc
class __$$MapViewerStateImplCopyWithImpl<$Res>
    extends _$MapViewerStateCopyWithImpl<$Res, _$MapViewerStateImpl>
    implements _$$MapViewerStateImplCopyWith<$Res> {
  __$$MapViewerStateImplCopyWithImpl(
      _$MapViewerStateImpl _value, $Res Function(_$MapViewerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? masterLocation = freezed,
    Object? currentLocation = freezed,
    Object? markers = null,
    Object? polylineCoordinates = null,
  }) {
    return _then(_$MapViewerStateImpl(
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
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<MarkerModel>,
      polylineCoordinates: null == polylineCoordinates
          ? _value._polylineCoordinates
          : polylineCoordinates // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
    ));
  }
}

/// @nodoc

class _$MapViewerStateImpl implements _MapViewerState {
  _$MapViewerStateImpl(
      {this.status = BaseStatus.initial,
      this.masterLocation,
      this.currentLocation,
      final List<MarkerModel> markers = const [],
      final List<LatLng> polylineCoordinates = const []})
      : _markers = markers,
        _polylineCoordinates = polylineCoordinates;

  @override
  @JsonKey()
  final BaseStatus status;
  @override
  final LatLng? masterLocation;
  @override
  final LatLng? currentLocation;
  final List<MarkerModel> _markers;
  @override
  @JsonKey()
  List<MarkerModel> get markers {
    if (_markers is EqualUnmodifiableListView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markers);
  }

  final List<LatLng> _polylineCoordinates;
  @override
  @JsonKey()
  List<LatLng> get polylineCoordinates {
    if (_polylineCoordinates is EqualUnmodifiableListView)
      return _polylineCoordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polylineCoordinates);
  }

  @override
  String toString() {
    return 'MapViewerState(status: $status, masterLocation: $masterLocation, currentLocation: $currentLocation, markers: $markers, polylineCoordinates: $polylineCoordinates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapViewerStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.masterLocation, masterLocation) ||
                other.masterLocation == masterLocation) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            const DeepCollectionEquality()
                .equals(other._polylineCoordinates, _polylineCoordinates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      masterLocation,
      currentLocation,
      const DeepCollectionEquality().hash(_markers),
      const DeepCollectionEquality().hash(_polylineCoordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapViewerStateImplCopyWith<_$MapViewerStateImpl> get copyWith =>
      __$$MapViewerStateImplCopyWithImpl<_$MapViewerStateImpl>(
          this, _$identity);
}

abstract class _MapViewerState implements MapViewerState {
  factory _MapViewerState(
      {final BaseStatus status,
      final LatLng? masterLocation,
      final LatLng? currentLocation,
      final List<MarkerModel> markers,
      final List<LatLng> polylineCoordinates}) = _$MapViewerStateImpl;

  @override
  BaseStatus get status;
  @override
  LatLng? get masterLocation;
  @override
  LatLng? get currentLocation;
  @override
  List<MarkerModel> get markers;
  @override
  List<LatLng> get polylineCoordinates;
  @override
  @JsonKey(ignore: true)
  _$$MapViewerStateImplCopyWith<_$MapViewerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
