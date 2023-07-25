// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnswerResponse _$$_AnswerResponseFromJson(Map<String, dynamic> json) =>
    _$_AnswerResponse(
      children: (json['children'] as List<dynamic>)
          .map((e) => AnswerDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AnswerResponseToJson(_$_AnswerResponse instance) =>
    <String, dynamic>{
      'children': instance.children,
    };

_$_AnswerDto _$$_AnswerDtoFromJson(Map<String, dynamic> json) => _$_AnswerDto(
      text: json['text'] as String,
    );

Map<String, dynamic> _$$_AnswerDtoToJson(_$_AnswerDto instance) =>
    <String, dynamic>{
      'text': instance.text,
    };
