import 'package:json_annotation/json_annotation.dart';
import '';

part 'historical_landmark.g.dart';

@JsonSerializable()
class HistoricalLandmark {
  const HistoricalLandmark({
    required this.formattedAddress,
    required this.displayName,
    this.photos = const [],
  });

  factory HistoricalLandmark.fromJson(Map<String, dynamic> json) =>
      _$HistoricalLandmarkFromJson(json);

  final String formattedAddress;
  final DisplayName displayName;
  final List<Photo> photos;
}

@JsonSerializable()
class DisplayName {
  const DisplayName({
    required this.text,
    required this.languageCode,
  });

  factory DisplayName.fromJson(Map<String, dynamic> json) =>
      _$DisplayNameFromJson(json);

  final String text;
  final String languageCode;
}

@JsonSerializable()
class AuthorAttribution {
  const AuthorAttribution({
    required this.displayName,
    required this.uri,
    required this.photoUri,
  });

  factory AuthorAttribution.fromJson(Map<String, dynamic> json) =>
      _$AuthorAttributionFromJson(json);

  final String displayName;
  final String uri;
  final String photoUri;
}

@JsonSerializable()
class Photo {
  const Photo({
    required this.name,
    required this.widthPx,
    required this.heightPx,
    required this.authorAttributions,
  });

  factory Photo.fromJson(Map<String, dynamic> json) =>
      _$PhotoFromJson(json);

  final String name;
  final int widthPx;
  final int heightPx;
  final List<AuthorAttribution> authorAttributions;
}
