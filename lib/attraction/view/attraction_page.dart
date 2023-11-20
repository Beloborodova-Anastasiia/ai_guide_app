import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../audio/audio_cubit.dart';
import '../../home/cubit/home_cubit.dart';
import '../../widgets/loading_widget.dart';
import '../bloc/attraction_bloc.dart';

class AttractionScreen extends StatelessWidget {
  AttractionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerCubit = BlocProvider.of<AudioCubit>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            'Attraction',
            style: const TextStyle(fontSize: 22),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              playerCubit.stopAudio();
              Navigator.of(context).pop();
              playerCubit.resetAudio();
            },
          ),
        ),
        body: BlocConsumer<AttractionBloc, AttractionState>(
            listener: (context, state) {
          context.read<AttractionBloc>().state;
        }, builder: (context, state) {
          if (state.isLoading) return LoadingWidget();
          return AttractionWidget();
        }));
  }
}

class AttractionWidget extends StatelessWidget {
  const AttractionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final attractionState = context.read<AttractionBloc>().state;
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    return BlocBuilder<AudioCubit, AudioState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
                child: Text(
                  attractionState.attraction.name,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              AudioButtonsWidget(),
              Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
                child: Text(
                  attractionState.attraction.description,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}


class AudioButtonsWidget extends StatelessWidget {
  const AudioButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioCubit, AudioState>(builder: (context, state) {
      final attractionState = context.read<AttractionBloc>().state;
      final playerCubit = BlocProvider.of<AudioCubit>(context);
      return Container(
        padding:
            const EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if ((state is AudioStopped) | (state is AudioInitial))
              FloatingActionButton(
                onPressed: () {
                  playerCubit.playAudio(attractionState.attraction.audioUrl);
                },
                child: const Icon(Icons.play_arrow),
              )
            else if (state is AudioPaused)
              FloatingActionButton(
                onPressed: () {
                  playerCubit.resumeAudio();
                },
                child: const Icon(Icons.play_arrow),
              )
            else
              FloatingActionButton(
                onPressed: () {
                  playerCubit.pauseAudio();
                },
                child: const Icon(Icons.pause),
              ),
            FloatingActionButton(
              onPressed: () {
                playerCubit.stopAudio();
              },
              child: const Icon(Icons.stop),
            ),
          ],
        ),
      );
    });
  }
}
