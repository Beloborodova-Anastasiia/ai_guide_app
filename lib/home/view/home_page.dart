import 'package:attraction_repository/attraction_repository.dart' hide Attraction;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_guide/home/home.dart';

import '../../attraction/bloc/attraction_bloc.dart';
import '../../attraction/models/attraction.dart';
import '../../attraction/view/attraction_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) =>
              AttractionBloc(attractionRepository: AttractionRepository()),
        ),
      ],
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // final attractionBloc = AttractionBloc(attractionRepository: AttractionRepository());

    // final attractionBloc = BlocProvider.of<AttractionBloc>(context);
    // final attraction =
    //     context.select((AttractionBloc bloc) => bloc.state.attraction);
    final textController = TextEditingController();

    // return Builder(
    //   builder: (context) {
    final attractionBloc = BlocProvider.of<AttractionBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('AI Audio Guide'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: TextField(
              controller: textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter attraction you want to find',
              ),
            ),
          ),
          Container(
            child: FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: () {
                final attrBloc = context.read<AttractionBloc>();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (_) => AttractionScreen(
                //             // attraction: attraction,
                //             )));
                attrBloc.add(GetAttractionEvent(textController.text));
              },
            ),
          ),
          BlocBuilder<AttractionBloc, AttractionState>(
            builder: (context, state) {
              return Column(
                children: [
                  if (state.isLoading) const CircularProgressIndicator(),
                  if (state.attraction.id != 0) Text(state.attraction.name),
                ],
              );
            },
          )
        ],
      ),
    );
  }
//   );
// }
}
