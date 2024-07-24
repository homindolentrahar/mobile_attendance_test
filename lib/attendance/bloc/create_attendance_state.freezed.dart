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
  XFile? get image => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  DateTime? get attendanceAt => throw _privateConstructorUsedError;

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
      {BaseStatus status, XFile? image, String title, DateTime? attendanceAt});
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
    Object? title = null,
    Object? attendanceAt = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      attendanceAt: freezed == attendanceAt
          ? _value.attendanceAt
          : attendanceAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      {BaseStatus status, XFile? image, String title, DateTime? attendanceAt});
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
    Object? title = null,
    Object? attendanceAt = freezed,
  }) {
    return _then(_$CreateAttendanceStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BaseStatus,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as XFile?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      attendanceAt: freezed == attendanceAt
          ? _value.attendanceAt
          : attendanceAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$CreateAttendanceStateImpl implements _CreateAttendanceState {
  const _$CreateAttendanceStateImpl(
      {this.status = BaseStatus.initial,
      this.image,
      this.title = "",
      this.attendanceAt});

  @override
  @JsonKey()
  final BaseStatus status;
  @override
  final XFile? image;
  @override
  @JsonKey()
  final String title;
  @override
  final DateTime? attendanceAt;

  @override
  String toString() {
    return 'CreateAttendanceState(status: $status, image: $image, title: $title, attendanceAt: $attendanceAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateAttendanceStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.attendanceAt, attendanceAt) ||
                other.attendanceAt == attendanceAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, image, title, attendanceAt);

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
      final XFile? image,
      final String title,
      final DateTime? attendanceAt}) = _$CreateAttendanceStateImpl;

  @override
  BaseStatus get status;
  @override
  XFile? get image;
  @override
  String get title;
  @override
  DateTime? get attendanceAt;
  @override
  @JsonKey(ignore: true)
  _$$CreateAttendanceStateImplCopyWith<_$CreateAttendanceStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
