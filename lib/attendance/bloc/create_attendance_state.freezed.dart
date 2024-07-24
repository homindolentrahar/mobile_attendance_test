// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_attendance_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateAttendanceState {
  BaseStatus get status => throw _privateConstructorUsedError;
  Uint8List? get image => throw _privateConstructorUsedError;
  DateTime? get attendanceAt => throw _privateConstructorUsedError;
  Placemark? get address => throw _privateConstructorUsedError;
  LatLng? get position => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateAttendanceStateCopyWith<CreateAttendanceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAttendanceStateCopyWith<$Res> {
  factory $CreateAttendanceStateCopyWith(CreateAttendanceState value,
          $Res Function(CreateAttendanceState) then) =
      _$CreateAttendanceStateCopyWithImpl<$Res, CreateAttendanceState>;
  @useResult
  $Res call(
      {BaseStatus status,
      Uint8List? image,
      DateTime? attendanceAt,
      Placemark? address,
      LatLng? position});
}

/// @nodoc
class _$CreateAttendanceStateCopyWithImpl<$Res,
        $Val extends CreateAttendanceState>
    implements $CreateAttendanceStateCopyWith<$Res> {
  _$CreateAttendanceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? image = freezed,
    Object? attendanceAt = freezed,
    Object? address = freezed,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      attendanceAt: freezed == attendanceAt
          ? _value.attendanceAt
          : attendanceAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Placemark?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateAttendanceStateImplCopyWith<$Res>
    implements $CreateAttendanceStateCopyWith<$Res> {
  factory _$$CreateAttendanceStateImplCopyWith(
          _$CreateAttendanceStateImpl value,
          $Res Function(_$CreateAttendanceStateImpl) then) =
      __$$CreateAttendanceStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BaseStatus status,
      Uint8List? image,
      DateTime? attendanceAt,
      Placemark? address,
      LatLng? position});
}

/// @nodoc
class __$$CreateAttendanceStateImplCopyWithImpl<$Res>
    extends _$CreateAttendanceStateCopyWithImpl<$Res,
        _$CreateAttendanceStateImpl>
    implements _$$CreateAttendanceStateImplCopyWith<$Res> {
  __$$CreateAttendanceStateImplCopyWithImpl(_$CreateAttendanceStateImpl _value,
      $Res Function(_$CreateAttendanceStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? image = freezed,
    Object? attendanceAt = freezed,
    Object? address = freezed,
    Object? position = freezed,
  }) {
    return _then(_$CreateAttendanceStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uint8List?,
      attendanceAt: freezed == attendanceAt
          ? _value.attendanceAt
          : attendanceAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Placemark?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc

class _$CreateAttendanceStateImpl
    with DiagnosticableTreeMixin
    implements _CreateAttendanceState {
  const _$CreateAttendanceStateImpl(
      {this.status = BaseStatus.initial,
      this.image,
      this.attendanceAt,
      this.address,
      this.position});

  @override
  @JsonKey()
  final BaseStatus status;
  @override
  final Uint8List? image;
  @override
  final DateTime? attendanceAt;
  @override
  final Placemark? address;
  @override
  final LatLng? position;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreateAttendanceState(status: $status, image: $image, attendanceAt: $attendanceAt, address: $address, position: $position)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreateAttendanceState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('attendanceAt', attendanceAt))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('position', position));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAttendanceStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            (identical(other.attendanceAt, attendanceAt) ||
                other.attendanceAt == attendanceAt) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(image),
      attendanceAt,
      address,
      position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateAttendanceStateImplCopyWith<_$CreateAttendanceStateImpl>
      get copyWith => __$$CreateAttendanceStateImplCopyWithImpl<
          _$CreateAttendanceStateImpl>(this, _$identity);
}

abstract class _CreateAttendanceState implements CreateAttendanceState {
  const factory _CreateAttendanceState(
      {final BaseStatus status,
      final Uint8List? image,
      final DateTime? attendanceAt,
      final Placemark? address,
      final LatLng? position}) = _$CreateAttendanceStateImpl;

  @override
  BaseStatus get status;
  @override
  Uint8List? get image;
  @override
  DateTime? get attendanceAt;
  @override
  Placemark? get address;
  @override
  LatLng? get position;
  @override
  @JsonKey(ignore: true)
  _$$CreateAttendanceStateImplCopyWith<_$CreateAttendanceStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
