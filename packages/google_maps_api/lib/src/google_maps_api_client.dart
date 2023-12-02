import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart' as http;
import 'package:google_maps_api/google_maps_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Exception thrown when attractionSearch fails.
class GoogleMapsRequestFailure implements Exception {}

/// Exception thrown when the provided attraction is not found.
class GoogleMapsNotFoundFailure implements Exception {}

/// {@template ai_guide_api_client}
/// Dart API Client which wraps the [Google Maps API](https://places.googleapis.com/v1/places:searchNearby).
/// {@endtemplate}
class GoogleMapsApiClient {
  /// {@macro ai_guide_api_client}
  GoogleMapsApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrlGoogleMaps = 'places.googleapis.com';

  final http.Client _httpClient;

  /// Fetches [HistoricalLandmark] for a given [body].
  Future<List<HistoricalLandmark>> getLandmarksNearby({
    required int maxResultCount,
    required double latitude,
    required double longitude,
    required double radius,
  }) async {
    final landmarksRequest =
        Uri.https(_baseUrlGoogleMaps, '/v1/places:searchNearby', {});
    final requestBody = json.encode({
      "includedTypes": ["historical_landmark"],
      "maxResultCount": maxResultCount,
      "locationRestriction": {
        "circle": {
          "center": {"latitude": latitude, "longitude": longitude},
          "radius": radius
        }
      }
    });
    final String _accessKey = dotenv.env['GOOGLE_API_KEY'].toString();
    final landmarksResponse =
        await _httpClient.post(landmarksRequest, body: requestBody, headers: {
      "Content-Type": "application/json",
      "X-Goog-Api-Key": _accessKey,
      "X-Goog-FieldMask":
          "places.displayName,places.formattedAddress,places.photos"
    });

    if (landmarksResponse.statusCode != 200) {
      throw GoogleMapsRequestFailure();
    }

    final bodyJson = jsonDecode(landmarksResponse.body) as Map<String, dynamic>;
    if (!bodyJson.containsKey('places')) {
      // throw GoogleMapsNotFoundFailure();
      return [];
    }
    List<HistoricalLandmark> historicalLandmarksList =
        List<HistoricalLandmark>.from(bodyJson['places']
            .map((model) => HistoricalLandmark.fromJson(model)));

    return historicalLandmarksList;
  }

  /// Fetches [HistoricalLandmark] for a given [body].
  Future<List<HistoricalLandmark>> getLandmarksSearch({
    required String textQuery,
  }) async {
    final landmarksRequest =
        Uri.https(_baseUrlGoogleMaps, '/v1/places:searchText', {});
    final requestBody = json.encode({
      "textQuery": textQuery,
    });
    final String _accessKey = dotenv.env['GOOGLE_API_KEY'].toString();
    final landmarksResponse =
        await _httpClient.post(landmarksRequest, body: requestBody, headers: {
      "Content-Type": "application/json",
      "X-Goog-Api-Key": _accessKey,
      "X-Goog-FieldMask":
          "places.displayName,places.formattedAddress,places.photos"
    });

    if (landmarksResponse.statusCode != 200) {
      throw GoogleMapsRequestFailure();
    }

    final bodyJson = jsonDecode(landmarksResponse.body) as Map<String, dynamic>;
    if (!bodyJson.containsKey('places')) {
      // throw GoogleMapsNotFoundFailure();
      return [];
    }
    List<HistoricalLandmark> historicalLandmarksList =
        List<HistoricalLandmark>.from(bodyJson['places']
            .map((model) => HistoricalLandmark.fromJson(model)));

    return historicalLandmarksList;
  }

  /// Fetches [HistoricalLandmark] for a given [body].
  PhotoLink getLandmarkPhotoLink({
    required String photoLink,
  }) {
    final photoUri = Uri.https(_baseUrlGoogleMaps, '/v1/$photoLink/media', {
        "maxHeightPx": "100",
        "maxWidthPx": "100",
      });
    final String _accessKey = dotenv.env['GOOGLE_API_KEY'].toString();
    final Map<String, String> headers = {
      "Content-Type": "application/json",
      "X-Goog-Api-Key": _accessKey,
    };
    return PhotoLink(link: photoUri.toString(), headers: headers);
  }
}

class PhotoLink {
  const PhotoLink({
    required this.link,
    required this.headers,});

  final String link;
  final Map<String, String> headers;
}
