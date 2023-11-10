import 'package:flutter/material.dart';
import 'package:ai_guide/attraction/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/attraction_bloc.dart';

class AttractionScreen extends StatelessWidget {
  const AttractionScreen({
    Key? key,
    // required this.attraction,
  }) : super(key: key);

  // final Attraction attraction;

  @override
  Widget build(BuildContext context) {
    // final attractionBloc = BlocProvider.of<AttractionBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(
          'Attraction',
          style: const TextStyle(fontSize: 22),
        ),
      ),
      body: BlocBuilder<AttractionBloc, AttractionState>(
        builder: (context, state) {
          return SingleChildScrollView(
              child: Column(
                children: [
                  if (state.isLoading) const CircularProgressIndicator(),
                  if (state.attraction.id != 0) Text(state.attraction.name),
                ],
          )
          ,
          );
        },
      ),
    );
  }
}
