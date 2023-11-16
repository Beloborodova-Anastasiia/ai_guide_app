part of 'attraction_bloc.dart';

class AttractionState {
  final Attraction attraction;
  final bool isLoading;

  AttractionState({
    Attraction? attraction,
    this.isLoading = false,
  }) : attraction = attraction ?? Attraction.empty;

  AttractionState copyWith({
    Attraction? attraction,
    bool isLoading = false,
  }) {
    return AttractionState(
      attraction: attraction ?? this.attraction,
      isLoading: isLoading,
    );
  }
}
