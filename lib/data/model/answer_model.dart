import 'package:freezed_annotation/freezed_annotation.dart';

part 'answer_model.freezed.dart';

@freezed
class AnswerModel with _$AnswerModel {
  const factory AnswerModel({
    required String text,
  }) = _AnswerModel;
}
