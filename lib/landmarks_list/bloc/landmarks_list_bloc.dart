import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:landmark_repository/landmark_repository.dart'
    show LandmarkRepository;
import 'package:meta/meta.dart';

import '../models/landmark.dart';

part 'landmarks_list_event.dart';

part 'landmarks_list_state.dart';

class LandmarksListBloc extends Bloc<LandmarksListEvent, LandmarksListState> {
  LandmarksListBloc({required LandmarkRepository landmarkRepository})
      : _landmarkRepository = landmarkRepository,
        super(LandmarksListState()) {
    on<LandmarksNearbyEvent>(_onLandmarksNearby);
    on<LandmarksSearchEvent>(_onLandmarksSearch);
  }

  late final LandmarkRepository _landmarkRepository;

  _onLandmarksNearby(LandmarksNearbyEvent event,
      Emitter<LandmarksListState> emit) async {
    emit(state.copyWith(isLoading: true));
    final landmarksListRepo = await _landmarkRepository.getLandmarksNearby(
        radius: event.radius, maxResultCount: event.maxResultCount);
    if (landmarksListRepo.isEmpty) {
      emit(state.copyWith(isLoading: false));
      emit(state.copyWith(notFounded: true));
    } else {
      final landmarksList = landmarksListRepo
          .map((landmark) => Landmark.fromRepository(landmark))
          .toList();
      emit(state.copyWith(landmarks: landmarksList));
      emit(state.copyWith(title: 'Nearest historical places'));
    }
  }

  _onLandmarksSearch(LandmarksSearchEvent event,
      Emitter<LandmarksListState> emit) async {
    emit(state.copyWith(isLoading: true));
    final landmarksListRepo = await _landmarkRepository.getLandmarksSearch(
        textQuery: event.textQuery);
    if (landmarksListRepo.isEmpty) {
      emit(state.copyWith(isLoading: false));
      emit(state.copyWith(notFounded: true));
    } else {
      final landmarksList = landmarksListRepo
          .map((landmark) => Landmark.fromRepository(landmark))
          .toList();
      emit(state.copyWith(landmarks: landmarksList));
      emit(state.copyWith(title: 'We found these places'));
    }
  }
}