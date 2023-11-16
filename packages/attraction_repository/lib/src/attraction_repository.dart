import 'dart:async';

import 'package:attraction_api/attraction_api.dart' hide Attraction;
import 'package:attraction_repository/attraction_repository.dart';

class AttractionRepository {
  AttractionRepository({AiGuideApiClient? attractionApiClient})
      : _attractionApiClient = attractionApiClient ?? AiGuideApiClient();

  final AiGuideApiClient _attractionApiClient;

  Future<Attraction> getAttraction(String query) async {
    final attraction = await _attractionApiClient.getAttraction(query: query);
    final audio = await _attractionApiClient.getAudio(id: attraction.id);
    return Attraction(
      id: attraction.id,
      name: attraction.object_name,
      description: attraction.content,
      audioUrl: audio.url,
    );
  }
}
