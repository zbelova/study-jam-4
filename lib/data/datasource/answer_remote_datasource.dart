import 'package:dio/dio.dart';
import '../dto/answer_response.dart';

class AnswerRemoteDatasource {
  final Dio _dio;


  AnswerRemoteDatasource(this._dio);

  Future<AnswerDto> getAnswer() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('https://eightballapi.com/api');
      final result = response.data;

      var answer = result!.keys.map((key) => AnswerDto(
        text: result[key],
      )).toList()[0];

      return answer;
    } catch (e) {
      return const AnswerDto(text: 'error');
    }
  }
}

