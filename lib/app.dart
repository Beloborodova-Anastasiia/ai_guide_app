import 'package:ai_guide/audio/audio_cubit.dart';
import 'package:ai_guide/landmarks_list/bloc/landmarks_list_bloc.dart';
import 'package:attraction_repository/attraction_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ai_guide/home/home.dart';
import 'package:google_maps_api/google_maps_api.dart';
import 'package:landmark_repository/landmark_repository.dart';
import 'package:location_service/location_service.dart';

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
            create: (context) =>
                AttractionBloc(attractionRepository: AttractionRepository()),
          ),
          BlocProvider(
            create: (context) => HomeCubit(),
          ),
          BlocProvider(
            create: (context) => AudioCubit(),
          ),
          BlocProvider(
              create: (context) =>
                  LandmarksListBloc(landmarkRepository: LandmarkRepository()))
        ],
        child: MaterialApp(
          title: 'AI Guide',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Color.fromRGBO(70, 130, 180, 1.0)),
            useMaterial3: true,
          ),
          home: HomePage(),
        ),
      ),
    );
  }
}
