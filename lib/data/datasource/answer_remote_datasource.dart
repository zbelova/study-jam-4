import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../dto/answer_response.dart';

class AnswerRemoteDatasource {
  final Dio _dio = Dio();
 // _dio.transformer = BackgroundTransformer()..jsonDecodeCallback = parseJson;

  AnswerRemoteDatasource();

  Future<List<AnswerDto>> getAnswer() async {
    final response = await _dio.get<Map<String, dynamic>>('https://eightballapi.com/api');

    final answer = ((response.data as Map<String, dynamic>) as List<dynamic>)
        .map(
          (e) => AnswerDto.fromJson(
        e['data'],
      ),
    )
        .toList();

    return answer;
  }
}

Map<String, dynamic> _parseAndDecode(String response) {
  final decoded = jsonDecode(response);

  return decoded as Map<String, dynamic>;
}

Future<Map<String, dynamic>> parseJson(String text) {
  return compute(_parseAndDecode, text);
}