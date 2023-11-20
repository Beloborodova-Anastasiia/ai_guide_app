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
    on<GetLandmarksListEvent>(_onLandmarkList);
  }

  late final LandmarkRepository _landmarkRepository;

  _onLandmarkList(
      GetLandmarksListEvent event, Emitter<LandmarksListState> emit) async {
    emit(state.copyWith(isLoading: true));
    final landmarksListRepo = await _landmarkRepository.getLandmarkList(
        radius: event.radius,
        maxResultCount: event.maxResultCount);
    if (landmarksListRepo.isEmpty) {
      emit(state.copyWith(isLoading: false));
      emit(state.copyWith(notFounded: true));
    } else {
      final landmarksList = landmarksListRepo
          .map((landmark) => Landmark.fromRepository(landmark))
          .toList();
      emit(state.copyWith(landmarks: landmarksList));
    }
  }
}
