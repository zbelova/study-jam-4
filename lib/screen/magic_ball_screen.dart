import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:get_it/get_it.dart';
import 'package:shake/shake.dart';
import 'package:surf_practice_magic_ball/data/model/answer_model.dart';
import '../bloc/answer_bloc.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> with TickerProviderStateMixin {
  //анимация появления шара
  late AnimationController _changeBallController;
  late Animation _fadeAnimation;

  //анимация плавающего шара
  late AnimationController _floatBallController;
  late Animation _floatAnimation;

  @override
  void initState() {
    super.initState();
    //описание анимации появления шара
    _changeBallController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _changeBallController,
      curve: Curves.easeIn,
    ));
    //запуск анимации появления шара
    _changeBallController.addListener(() {
      setState(() {});
    });
    _changeBallController.forward();

    //описание анимации плавающего шара
    _floatBallController = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _floatAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _floatBallController,
      curve: Curves.easeInOut,
    ));
    //запуск анимации плавающего шара
    _floatAnimation.addListener(() {
      setState(() {});
    });
    _floatBallController.repeat(reverse: true);
  }

  @override
  void dispose() {
    //остановка анимаций и контроллеров
    _changeBallController.dispose();
    _floatBallController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF0D0D38),
                    Colors.black,
                  ],
                ),
              ),
              child: Column(
                children: [
                  const Spacer(),
                  //подключение блока
                  BlocProvider(
                    create: (context) => AnswerBloc(
                      GetIt.I.get(),
                    ),
                    child: BlocConsumer<AnswerBloc, AnswerState>(
                      listener: (context, state) {
                        //изменение состояния анимации фейда при изменении состояния блока
                        state.maybeWhen(
                          orElse: () {
                            _changeBallController.reverse(from: 0.5);
                            _changeBallController.forward(from: 0.5);
                          },
                          loading: () {
                            _changeBallController.reverse();
                          },
                          fetched: (fetched) {
                            _changeBallController.forward();
                            _floatBallController.stop();
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.map(
                          start: (_) {
                            //отображение шара с загрузкой и начального состояния
                            return _buildInitialBall();
                          },
                          loading: (_) {
                            //отображение шара с загрузкой и начального состояния
                            return _buildLoadingBall();
                          },
                          fetched: (fetched) {
                            //отображение шара с ответом
                            return _buildLoadedBall(fetched.answer);
                          },
                          error: (error) {
                            //отображение шара с ошибкой
                            return _buildErrorBall();
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 150,
                    child: const Text(
                      'Нажмите на шар или потрясите телефон',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildLoadedBall(AnswerModel? answer) {
    return Builder(builder: (context) {
      //получение ответа по трясению
      ShakeDetector.autoStart(
        onPhoneShake: () {
          //отправить событие в блок
          context.read<AnswerBloc>().add(
                const AnswerEvent.fetchData(),
              );
        },
        minimumShakeCount: 1,
        shakeSlopTimeMS: 500,
        shakeCountResetTime: 3000,
        shakeThresholdGravity: 2.7,
      );
      //получение ответа по тапу
      return GestureDetector(
          onTap: () {
            context.read<AnswerBloc>().add(
                  const AnswerEvent.fetchData(),
                );
          },
          //прозрачность анимируется
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Column(
              children: [
                SizedBox(
                  height: _floatAnimation.value * 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 20,
                  height: MediaQuery.of(context).size.height - 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'lib/assets/magic_ball_clear.png',
                      ),
                    ),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 150,
                      //размер текста адаптируется под размер шара
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        //свечение текста
                        child: GlowText(
                          blurRadius: 20,
                          softWrap: true,
                          offset: const Offset(0, 0),
                          answer!.text,
                          style: const TextStyle(
                            color: Color(0xFF99E0FF),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 300,
                  height: 100,
                  child: Image.asset('lib/assets/ellipse_blue.png'),
                ),
              ],
            ),
          ));
    });
  }

  Widget _buildInitialBall() {
    return Builder(builder: (context) {
      //получение ответа по трясению
      ShakeDetector.autoStart(
        onPhoneShake: () {
          //отправить событие в блок
          context.read<AnswerBloc>().add(
                const AnswerEvent.fetchData(),
              );
        },
        minimumShakeCount: 1,
        shakeSlopTimeMS: 500,
        shakeCountResetTime: 3000,
        shakeThresholdGravity: 2.7,
      );
      //получение ответа по тапу
      return GestureDetector(
        onTap: () {
          context.read<AnswerBloc>().add(
                const AnswerEvent.fetchData(),
              );
        },
        //прозрачность анимируется
        child: Opacity(
          opacity: _fadeAnimation.value,
          child: Column(
            children: [
              SizedBox(
                height: _floatAnimation.value * 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height - 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/magic_ball_initial.png'),
                  ),
                ),
              ),
              SizedBox(
                height: _floatAnimation.value * 10,
              ),
              SizedBox(
                width: 300,
                height: 100,
                child: Image.asset('lib/assets/ellipse_blue.png'),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildLoadingBall() {
    return Builder(builder: (context) {
      return Opacity(
        opacity: _fadeAnimation.value,
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              height: MediaQuery.of(context).size.height - 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/magic_ball_clear.png'),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 100,
              child: Image.asset('lib/assets/ellipse_blue.png'),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildErrorBall() {
    return Builder(builder: (context) {
      //получение ответа по трясению
      ShakeDetector.autoStart(
        onPhoneShake: () {
          //отправить событие в блок
          context.read<AnswerBloc>().add(
                const AnswerEvent.fetchData(),
              );
        },
        minimumShakeCount: 1,
        shakeSlopTimeMS: 500,
        shakeCountResetTime: 3000,
        shakeThresholdGravity: 2.7,
      );
      //получение ответа по тапу
      return GestureDetector(
        onTap: () {
          context.read<AnswerBloc>().add(
                const AnswerEvent.fetchData(),
              );
        },
        //прозрачность анимируется
        child: Opacity(
          opacity: _fadeAnimation.value,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height - 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/magic_ball_error.png'),
                  ),
                ),
              ),
              Image.asset('lib/assets/ellipse_red.png')
            ],
          ),
        ),
      );
    });
  }
}
