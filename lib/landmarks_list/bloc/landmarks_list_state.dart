part of 'landmarks_list_bloc.dart';

class LandmarksListState {
  final List<Landmark> landmarks;
  final bool isLoading;

  LandmarksListState({
    List<Landmark>? landmarks,
    this.isLoading = false,
  }) : landmarks = landmarks ?? [];

  LandmarksListState copyWith({
    List<Landmark>? landmarks,
    bool isLoading = false,
  }) {
    return LandmarksListState(
      landmarks: landmarks ?? this.landmarks,
      isLoading: isLoading,
    );
  }
}
