part of 'landmarks_list_bloc.dart';

class LandmarksListState {
  final List<Landmark> landmarks;
  final bool isLoading;
  final bool notFounded;
  final String title;

  LandmarksListState({
    List<Landmark>? landmarks,
    this.isLoading = false,
    this.notFounded = false,
    this.title = '',
  }) : landmarks = landmarks ?? [];

  LandmarksListState copyWith({
    List<Landmark>? landmarks,
    bool isLoading = false,
    bool notFounded = false,
    String title = '',
  }) {
    return LandmarksListState(
      landmarks: landmarks ?? this.landmarks,
      isLoading: isLoading,
      notFounded: notFounded,
      title: title,
    );
  }
}
