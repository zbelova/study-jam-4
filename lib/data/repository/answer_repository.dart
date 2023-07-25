
import '../datasource/answer_remote_datasource.dart';
import '../model/answer_model.dart';

class AnswerRepository {
  final AnswerRemoteDatasource _remoteDatasource;

  AnswerRepository(
    this._remoteDatasource,
  );

  Future<List<AnswerModel>> getAnswer() async {
    try {
      final remoteDtos = (await _remoteDatasource.getAnswer())
          .map(
            (dto) => AnswerModel(
              text: dto.text,
            ),
          )
          .toList();


      final resultList = remoteDtos;
      return resultList;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
