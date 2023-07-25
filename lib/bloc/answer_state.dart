part of 'answer_bloc.dart';

//состояния для блока получения данных ответа
@freezed
class AnswerState with _$AnswerState {
  const factory AnswerState.start() = _Start;
  const factory AnswerState.loading() = _Loading;
  const factory AnswerState.fetched({required AnswerModel answer}) = _Fetched;
  const factory AnswerState.error() = _Error;
}
