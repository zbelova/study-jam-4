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

class _MagicBallScreenState extends State<MagicBallScreen> with SingleTickerProviderStateMixin {
  late AnimationController _changeBallController;
  late Animation _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _changeBallController = AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _changeBallController,
      curve: Curves.easeIn,
    ));
    _changeBallController.addListener(() {
      setState(() {});
    });
    _changeBallController.forward();
    ShakeDetector detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Shake!'),
          ),
        );
        // Do stuff on phone shake
      },
      minimumShakeCount: 1,
      shakeSlopTimeMS: 500,
      shakeCountResetTime: 3000,
      shakeThresholdGravity: 2.7,
    );
  }

  @override
  void dispose() {
    _changeBallController.dispose();
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
                  BlocProvider(
                    create: (context) => AnswerBloc(
                      GetIt.I.get(),
                    ),
                    child: BlocConsumer<AnswerBloc, AnswerState>(
                      listener: (context, state) {
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
                          },
                        );
                      },
                      builder: (context, state) {
                        return state.map(
                          loading: (_) {
                            //отображение шара с загрузкой и начального состояния
                            return _buildInitialBall();
                          },
                          //отображение шара с ответом
                          fetched: (fetched) {
                            return _buildLoadedBall(fetched.answer);
                          },
                          //отображение шара с ошибкой
                          error: (error) {
                            return _buildErrorBall();
                          },
                        );
                      },
                    ),
                  ),
                  const Spacer(),
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
                  const Spacer()
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildLoadedBall(AnswerModel? answer) {
    return Builder(builder: (context) {
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
                  child: Image.asset('lib/assets/ellipse_blue.png'),
                  width: 300,
                  height: 100,
                ),
              ],
            ),
          ));
    });
  }

  Widget _buildInitialBall() {
    return Builder(builder: (context) {
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
                    image: AssetImage('lib/assets/magic_ball_initial.png'),
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
        ),
      );
    });
  }

  Widget _buildErrorBall() {
    return Builder(builder: (context) {
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
