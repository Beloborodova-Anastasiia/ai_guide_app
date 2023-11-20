part of 'landmarks_list_bloc.dart';

@immutable
abstract class LandmarksListEvent {}

class GetLandmarksListEvent extends LandmarksListEvent {
  final double radius;
  final int maxResultCount;

  // GetLandmarksListEvent(this.radius, this.maxResultCount);
  GetLandmarksListEvent({
    required this.radius,
    required this.maxResultCount,});
}