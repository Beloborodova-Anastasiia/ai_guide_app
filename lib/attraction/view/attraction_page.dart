import 'package:flutter/material.dart';
import 'package:ai_guide/attraction/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../bloc/attraction_bloc.dart';

class AttractionScreen extends StatelessWidget {
  AttractionScreen({Key? key}) : super(key: key);

  // final Attraction attraction;

  @override
  Widget build(BuildContext context) {
    // final attractionBloc = BlocProvider.of<AttractionBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            'Attraction',
            style: const TextStyle(fontSize: 22),
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
    return BlocBuilder<AttractionBloc, AttractionState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
                child: Text(
                  state.attraction.name,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 20, bottom: 20),
                child: Text(
                  state.attraction.description,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.waveDots(
        color: Theme.of(context).colorScheme.inversePrimary,
        size: 100,
      ),
    );
  }
}
