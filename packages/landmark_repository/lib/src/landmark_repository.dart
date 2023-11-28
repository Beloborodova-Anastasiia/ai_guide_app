import 'dart:async';

import 'package:google_maps_api/google_maps_api.dart';
import 'package:landmark_repository/landmark_repository.dart';
import 'package:location_service/location_service.dart';

class LandmarkRepository {
  LandmarkRepository(
      {GoogleMapsApiClient? googleMapsApiClient,
      LocationServiceClient? locationClient})
      : _googleMapsApiClient = googleMapsApiClient ?? GoogleMapsApiClient(),
        _locationClient = locationClient ?? LocationServiceClient();

  final GoogleMapsApiClient _googleMapsApiClient;
  late final LocationServiceClient _locationClient;

  Future<List<Landmark>> getLandmarksNearby(
      {required double radius, required int maxResultCount}) async {
    final position = await _locationClient.getPosition();
    final landmarksApiList = await _googleMapsApiClient.getLandmarksNearby(
      maxResultCount: maxResultCount,
      latitude: position.latitude,
      longitude: position.longitude,
      radius: radius,
    );
    if (landmarksApiList.isNotEmpty)
      return landmarksApiList
          .map((landmark) => Landmark(
              name: landmark.displayName.text,
              location: landmark.formattedAddress))
          .toList();
    return [];
  }

  Future<List<Landmark>> getLandmarksSearch({required String textQuery}) async {
    final landmarksApiList =
        await _googleMapsApiClient.getLandmarksSearch(textQuery: textQuery);
    if (landmarksApiList.isNotEmpty) {
      return landmarksApiList
          .map((landmark) => Landmark(
              name: landmark.displayName.text,
              location: landmark.formattedAddress))
          .toList();
    }
    return [];
  }
}
