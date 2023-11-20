part of 'landmarks_list_bloc.dart';

class LandmarksListState {
  final List<Landmark> landmarks;
  final bool isLoading;
  final bool notFounded;

  LandmarksListState({
    List<Landmark>? landmarks,
    this.isLoading = false,
    this.notFounded = false,
  }) : landmarks = landmarks ?? [];

  LandmarksListState copyWith({
    List<Landmark>? landmarks,
    bool isLoading = false,
    bool notFounded = false,
  }) {
    return LandmarksListState(
      landmarks: landmarks ?? this.landmarks,
      isLoading: isLoading,
      notFounded: notFounded,
    );
  }
}
