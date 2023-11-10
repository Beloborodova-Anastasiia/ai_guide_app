import 'package:attraction_repository/attraction_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_guide/home/home.dart';

import 'attraction/bloc/attraction_bloc.dart';


class AiGuideApp extends StatelessWidget {
  const AiGuideApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AttractionRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AttractionBloc(attractionRepository: AttractionRepository()),
          ),
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'AI Guide',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomePage(),
        ),
      ),
    );
  }
}

