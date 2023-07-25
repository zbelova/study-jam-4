part of 'answer_bloc.dart';

@freezed
class AnswerState with _$AnswerState {
  const factory AnswerState.loading() = _Loading;
  const factory AnswerState.fetched({required AnswerModel answer}) = _Fetched;
  const factory AnswerState.error() = _Error;
}
