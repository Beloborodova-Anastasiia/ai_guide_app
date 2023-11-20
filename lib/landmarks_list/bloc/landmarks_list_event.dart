part of 'landmarks_list_bloc.dart';

@immutable
abstract class LandmarksListEvent {}

class GetLandmarksListEvent extends LandmarksListEvent {
  final double latitude;
  final double longitude;
  final double radius;
  final int maxResultCount;

  GetLandmarksListEvent(this.latitude, this.longitude, this.radius, this.maxResultCount);
}
