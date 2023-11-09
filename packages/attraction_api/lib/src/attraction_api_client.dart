import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:attraction_api/attraction_api.dart';

/// Exception thrown when attractionSearch fails.
class AttractionRequestFailure implements Exception {}

/// Exception thrown when the provided attraction is not found.
class AttractionNotFoundFailure implements Exception {}

/// {@template ai_guide_api_client}
/// Dart API Client which wraps the [AI Guide API](https://13.43.86.146).
/// {@endtemplate}
class AiGuideApiClient {
  /// {@macro ai_guide_api_client}
  AiGuideApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  static const _baseUrlAiGuide = '13.43.86.146';

  final http.Client _httpClient;

  /// Fetches [Attraction] for a given [query].
  Future<Attraction> getAttraction({
    required String query,
  }) async {
    final attractionRequest = Uri.https(_baseUrlAiGuide, 'get_guide', {
      'latitude': '$query',
    });

    final weatherResponse = await _httpClient.get(attractionRequest);

    if (weatherResponse.statusCode != 200) {
      throw AttractionRequestFailure();
    }
    final bodyJson = jsonDecode(weatherResponse.body) as Map<String, dynamic>;

    if (!bodyJson.containsKey('object_name')) {
      throw AttractionNotFoundFailure();
    }

    final attractionJson = bodyJson;

    return Attraction.fromJson(attractionJson);
  }
}
