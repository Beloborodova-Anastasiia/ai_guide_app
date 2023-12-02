import 'dart:async';

import 'package:google_maps_api/google_maps_api.dart' hide Photo;
import 'package:landmark_repository/landmark_repository.dart';
import 'package:location_service/location_service.dart';

class LandmarkRepository {
  LandmarkRepository({GoogleMapsApiClient? googleMapsApiClient,
    LocationServiceClient? locationClient})
      : _googleMapsApiClient = googleMapsApiClient ?? GoogleMapsApiClient(),
        _locationClient = locationClient ?? LocationServiceClient();

  final GoogleMapsApiClient _googleMapsApiClient;
  late final LocationServiceClient _locationClient;

  Future<List<LandmarkRepo>> getLandmarksNearby(
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
          .map((landmark) =>
          LandmarkRepo(
              name: landmark.displayName.text,
              location: landmark.formattedAddress,
              photo: getPhoto(landmark: landmark),))
        .toList();
    return [];
    }

  Future<List<LandmarkRepo>> getLandmarksSearch({required String textQuery}) async {
    final landmarksApiList =
    await _googleMapsApiClient.getLandmarksSearch(textQuery: textQuery);
    if (landmarksApiList.isNotEmpty) {
      return landmarksApiList
          .map((landmark) =>
          LandmarkRepo(
            name: landmark.displayName.text,
            location: landmark.formattedAddress,
            photo: getPhoto(landmark: landmark),))
          .toList();
    }
    return [];
  }

  PhotoRepo getPhoto({required landmark}) {

    if (landmark.photos.isEmpty) {
      return PhotoRepo(link: '', headers: {});
    }

    final photoLink = _googleMapsApiClient.getLandmarkPhotoLink(
        photoLink: landmark.photos[0].name);
    return PhotoRepo(link: photoLink.link, headers: photoLink.headers);
  }
}
