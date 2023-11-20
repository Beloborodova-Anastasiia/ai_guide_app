import 'package:json_annotation/json_annotation.dart';
import '';

part 'historical_landmark.g.dart';

@JsonSerializable()
class HistoricalLandmark {

  const HistoricalLandmark({
    required this.formattedAddress,
    required this.displayName,
  });

  factory HistoricalLandmark.fromJson(Map<String, dynamic> json) =>
      _$HistoricalLandmarkFromJson(json);

  final String formattedAddress;
  final DisplayName displayName;
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