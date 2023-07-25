import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:surf_practice_magic_ball/data/model/answer_model.dart';

import '../bloc/answer_bloc.dart';
import '../widgets.dart';

class MagicBallScreen extends StatefulWidget {
  const MagicBallScreen({Key? key}) : super(key: key);

  @override
  State<MagicBallScreen> createState() => _MagicBallScreenState();
}

class _MagicBallScreenState extends State<MagicBallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: BlocProvider(
        create: (context) => AnswerBloc(
          GetIt.I.get(),
        ),
        child: BlocConsumer<AnswerBloc, AnswerState>(
          listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              loading: () {},
            );
          },
          builder: (context, state) {
            return state.map(
              loading: (_) {
                return _buildContent(null);
              },
              fetched: (fetched) {
                return _buildContent(fetched.answer);
              },
              error: (error) {
                return LoadingErrorWidget(
                  onRetry: () {
                    context.read<AnswerBloc>().add(
                          const AnswerEvent.fetchData(),
                        );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildContent(AnswerModel? answer) {
    return Column(
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
              Spacer(),
              GestureDetector(
                onTap: () {
                  context.read<AnswerBloc>().add(
                        const AnswerEvent.fetchData(),
                      );
                },
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/magic_ball_initial.png'),
                    ),
                  ),
                ),
              ),
              Spacer(),
              if (answer != null)
                Text(
                  answer.text,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
