import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../data/model/answer_model.dart';
import '../data/repository/answer_repository.dart';


part 'answer_bloc.freezed.dart';
part 'answer_event.dart';
part 'answer_state.dart';

class AnswerBloc extends Bloc<AnswerEvent, AnswerState> {
  final AnswerRepository _answerRepository;

  AnswerBloc(this._answerRepository) : super(const AnswerState.loading()) {
    on<_FetchData>(_onFetchData);
  }

  Future<void> _onFetchData(
      _FetchData event,
      Emitter emit,
      ) async {
    emit(const AnswerState.loading());
    final posts = await _answerRepository.getAnswer();

    emit(AnswerState.fetched(posts: posts));
  }
}
