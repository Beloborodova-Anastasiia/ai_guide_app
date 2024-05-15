import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ai_guide_api/ai_guide_api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

  final String _baseUrlAiGuide = dotenv.env['URL_AI_GUIDE'].toString();
  // static const _baseUrlAiGuide = '10.0.2.2:8000';
  final http.Client _httpClient;

  /// Fetches [Attraction] for a given [query].
  Future<Attraction> getAttraction({
    required String name,
    required String location
  }) async {
    // final attractionRequest = Uri.https(_baseUrlAiGuide, 'get_guide/', {
    //   "query": "$query",
    // });

    final attractionRequest = Uri.http(
      _baseUrlAiGuide,
      'get_guide/',
    );
    final requestBody = json.encode({
      'name': name,
      'location': location
    });
    final attractionResponse = await _httpClient.post(attractionRequest,
        body: requestBody, headers: {"Content-Type": "application/json"});
    if (attractionResponse.statusCode != 200) {
      // throw AttractionRequestFailure();

    }
    final bodyJson =
        // jsonDecode(attractionResponse.body) as Map<String, dynamic>;
    jsonDecode(utf8.decode(attractionResponse.bodyBytes)) as Map<String, dynamic>;

    if (!bodyJson.containsKey('object_name')) {
      throw AttractionNotFoundFailure();
    }

    final attractionJson = bodyJson;

    return Attraction.fromJson(attractionJson);
  }

  Future<Audio> getAudio({required int id}) async {
    final strId = id.toString();
    final url = Uri.http(_baseUrlAiGuide, 'get_audio/$strId/').toString();
    return Audio(url: url);
  }

}
