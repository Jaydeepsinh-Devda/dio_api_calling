import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_failure.freezed.dart';
part 'response_failure.g.dart';

@freezed
class ResponseFailure with _$ResponseFailure {
    const factory ResponseFailure({
        required String message,
        required int applicationStatusCode,
        required int httpStatus,
        required dynamic fieldErrors,
    }) = _ResponseFailure;

    factory ResponseFailure.fromJson(Map<String, dynamic> json) => _$ResponseFailureFromJson(json);
}
