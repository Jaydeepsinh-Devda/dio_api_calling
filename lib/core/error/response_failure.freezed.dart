// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResponseFailure _$ResponseFailureFromJson(Map<String, dynamic> json) {
  return _ResponseFailure.fromJson(json);
}

/// @nodoc
mixin _$ResponseFailure {
  String get message => throw _privateConstructorUsedError;
  int get applicationStatusCode => throw _privateConstructorUsedError;
  int get httpStatus => throw _privateConstructorUsedError;
  dynamic get fieldErrors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseFailureCopyWith<ResponseFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseFailureCopyWith<$Res> {
  factory $ResponseFailureCopyWith(
          ResponseFailure value, $Res Function(ResponseFailure) then) =
      _$ResponseFailureCopyWithImpl<$Res, ResponseFailure>;
  @useResult
  $Res call(
      {String message,
      int applicationStatusCode,
      int httpStatus,
      dynamic fieldErrors});
}

/// @nodoc
class _$ResponseFailureCopyWithImpl<$Res, $Val extends ResponseFailure>
    implements $ResponseFailureCopyWith<$Res> {
  _$ResponseFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? applicationStatusCode = null,
    Object? httpStatus = null,
    Object? fieldErrors = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      applicationStatusCode: null == applicationStatusCode
          ? _value.applicationStatusCode
          : applicationStatusCode // ignore: cast_nullable_to_non_nullable
              as int,
      httpStatus: null == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as int,
      fieldErrors: freezed == fieldErrors
          ? _value.fieldErrors
          : fieldErrors // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResponseFailureImplCopyWith<$Res>
    implements $ResponseFailureCopyWith<$Res> {
  factory _$$ResponseFailureImplCopyWith(_$ResponseFailureImpl value,
          $Res Function(_$ResponseFailureImpl) then) =
      __$$ResponseFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      int applicationStatusCode,
      int httpStatus,
      dynamic fieldErrors});
}

/// @nodoc
class __$$ResponseFailureImplCopyWithImpl<$Res>
    extends _$ResponseFailureCopyWithImpl<$Res, _$ResponseFailureImpl>
    implements _$$ResponseFailureImplCopyWith<$Res> {
  __$$ResponseFailureImplCopyWithImpl(
      _$ResponseFailureImpl _value, $Res Function(_$ResponseFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? applicationStatusCode = null,
    Object? httpStatus = null,
    Object? fieldErrors = freezed,
  }) {
    return _then(_$ResponseFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      applicationStatusCode: null == applicationStatusCode
          ? _value.applicationStatusCode
          : applicationStatusCode // ignore: cast_nullable_to_non_nullable
              as int,
      httpStatus: null == httpStatus
          ? _value.httpStatus
          : httpStatus // ignore: cast_nullable_to_non_nullable
              as int,
      fieldErrors: freezed == fieldErrors
          ? _value.fieldErrors
          : fieldErrors // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResponseFailureImpl implements _ResponseFailure {
  const _$ResponseFailureImpl(
      {required this.message,
      required this.applicationStatusCode,
      required this.httpStatus,
      required this.fieldErrors});

  factory _$ResponseFailureImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResponseFailureImplFromJson(json);

  @override
  final String message;
  @override
  final int applicationStatusCode;
  @override
  final int httpStatus;
  @override
  final dynamic fieldErrors;

  @override
  String toString() {
    return 'ResponseFailure(message: $message, applicationStatusCode: $applicationStatusCode, httpStatus: $httpStatus, fieldErrors: $fieldErrors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseFailureImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.applicationStatusCode, applicationStatusCode) ||
                other.applicationStatusCode == applicationStatusCode) &&
            (identical(other.httpStatus, httpStatus) ||
                other.httpStatus == httpStatus) &&
            const DeepCollectionEquality()
                .equals(other.fieldErrors, fieldErrors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, applicationStatusCode,
      httpStatus, const DeepCollectionEquality().hash(fieldErrors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseFailureImplCopyWith<_$ResponseFailureImpl> get copyWith =>
      __$$ResponseFailureImplCopyWithImpl<_$ResponseFailureImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResponseFailureImplToJson(
      this,
    );
  }
}

abstract class _ResponseFailure implements ResponseFailure {
  const factory _ResponseFailure(
      {required final String message,
      required final int applicationStatusCode,
      required final int httpStatus,
      required final dynamic fieldErrors}) = _$ResponseFailureImpl;

  factory _ResponseFailure.fromJson(Map<String, dynamic> json) =
      _$ResponseFailureImpl.fromJson;

  @override
  String get message;
  @override
  int get applicationStatusCode;
  @override
  int get httpStatus;
  @override
  dynamic get fieldErrors;
  @override
  @JsonKey(ignore: true)
  _$$ResponseFailureImplCopyWith<_$ResponseFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
