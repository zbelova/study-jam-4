part of 'answer_bloc.dart';

//состояния для блока получения данных ответа
@freezed
class AnswerEvent with _$AnswerEvent {
  const factory AnswerEvent.fetchData() = _FetchData;
}
