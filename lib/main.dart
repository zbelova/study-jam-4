import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_practice_magic_ball/screen/magic_ball_screen.dart';

import 'data/datasource/answer_remote_datasource.dart';
import 'data/repository/answer_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio();
  dio.transformer = BackgroundTransformer()..jsonDecodeCallback = parseJson;

  GetIt.I.registerSingleton(dio);
  GetIt.I.registerSingleton(AnswerRemoteDatasource(GetIt.I.get()));
  runApp(const MyApp());
  GetIt.I.registerSingleton(
    AnswerRepository(
      GetIt.I.get(),
    ),
  );
}

Map<String, dynamic> _parseAndDecode(String response) {
  final decoded = jsonDecode(response);

  return decoded as Map<String, dynamic>;
}

Future<Map<String, dynamic>> parseJson(String text) {
  return compute(_parseAndDecode, text);
}

/// App,s main widget.
class MyApp extends StatelessWidget {
  /// Constructor for [MyApp].
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MagicBallScreen(),
    );
  }
}
