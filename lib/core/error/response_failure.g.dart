// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_failure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResponseFailureImpl _$$ResponseFailureImplFromJson(
        Map<String, dynamic> json) =>
    _$ResponseFailureImpl(
      message: json['message'] as String,
      applicationStatusCode: json['applicationStatusCode'] as int,
      httpStatus: json['httpStatus'] as int,
      fieldErrors: json['fieldErrors'],
    );

Map<String, dynamic> _$$ResponseFailureImplToJson(
        _$ResponseFailureImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'applicationStatusCode': instance.applicationStatusCode,
      'httpStatus': instance.httpStatus,
      'fieldErrors': instance.fieldErrors,
    };
