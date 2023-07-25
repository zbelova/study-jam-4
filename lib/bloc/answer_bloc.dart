import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/model/answer_model.dart';
import '../data/repository/answer_repository.dart';
part 'answer_bloc.freezed.dart';
part 'answer_event.dart';
part 'answer_state.dart';

//bloc класс для получения данных ответа

class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  final AnswerRepository _answerRepository;

  AnswerBloc(this._answerRepository) : super(const AnswerState.start()) {
    on<_FetchData>(_onFetchData);
  }

  //получение данных ответа
  Future<void> _onFetchData(
      _FetchData event,
      Emitter emit,
      ) async {
    emit(const AnswerState.loading());
    final answer = await _answerRepository.getAnswer();

    //если произошла ошибка при получении данных
    if(answer.text == 'error') {
      emit(const AnswerState.error());
      return;
    }
    emit(AnswerState.fetched(answer: answer));
  }
}
