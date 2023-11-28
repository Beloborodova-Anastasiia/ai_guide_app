part of 'landmarks_list_bloc.dart';

@immutable
abstract class LandmarksListEvent {}

class LandmarksNearbyEvent extends LandmarksListEvent {
  final double radius;
  final int maxResultCount;

  LandmarksNearbyEvent({
    required this.radius,
    required this.maxResultCount,});
}

class LandmarksSearchEvent extends LandmarksListEvent {
  final String textQuery;

  LandmarksSearchEvent({
    required this.textQuery});
}
