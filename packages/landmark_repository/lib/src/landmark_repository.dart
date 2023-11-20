import 'dart:async';

import 'package:google_maps_api/google_maps_api.dart';
import 'package:landmark_repository/landmark_repository.dart';

class LandmarkRepository {
  LandmarkRepository({GoogleMapsApiClient? googleMapsApiClient})
      : _googleMapsApiClient = googleMapsApiClient ?? GoogleMapsApiClient();

  final GoogleMapsApiClient _googleMapsApiClient;

  Future<List<Landmark>> getLandmarkList(
      {required double latitude,
      required double longitude,
      required double radius,
      required int maxResultCount}) async {
    final landmarksApiList =
        await _googleMapsApiClient.getHistoricalLandmarkList(
      maxResultCount: maxResultCount,
      latitude: latitude,
      longitude: longitude,
      radius: radius,
    );
    // List<Landmark> landmarksList = landmarksApiList
    return landmarksApiList
        .map((landmark) => Landmark(
            name: landmark.displayName.text,
            location: landmark.formattedAddress))
        .toList();
  }
}
