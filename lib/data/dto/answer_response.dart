import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_response.freezed.dart';
part 'answer_response.g.dart';

//ответ на запрос с freezed аннотациями
@freezed
class AnswerResponse with _$AnswerResponse {
  const factory AnswerResponse({required List<AnswerDto> children}) =
  _AnswerResponse;

  factory AnswerResponse.fromJson(Map<String, dynamic> json) =>
      _$AnswerResponseFromJson(json);
}

@freezed
class AnswerDto with _$AnswerDto {
  const factory AnswerDto({
    required String text,

  }) = _AnswerDto;

  factory AnswerDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerDtoFromJson(json);
}
