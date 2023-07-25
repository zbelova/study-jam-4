import '../datasource/answer_remote_datasource.dart';
import '../model/answer_model.dart';

//репозиторий для получения данных ответа
class AnswerRepository {
  final AnswerRemoteDatasource _remoteDatasource;

  AnswerRepository(
    this._remoteDatasource,
  );

  Future<AnswerModel> getAnswer() async {
    try {
      final remoteDto = (await _remoteDatasource.getAnswer());
      final answer = AnswerModel(
        text: remoteDto.text,
      );
      return answer;
    } catch (e) {
      return AnswerModel(text: 'error');
    }
  }
}
