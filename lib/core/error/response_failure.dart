import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_failure.freezed.dart';
part 'response_failure.g.dart';

@freezed
class ResponseFailure with _$ResponseFailure {
    const factory ResponseFailure({
        required String error,
    }) = _ResponseFailure;

    factory ResponseFailure.fromJson(Map<String, dynamic> json) => _$ResponseFailureFromJson(json);
}
