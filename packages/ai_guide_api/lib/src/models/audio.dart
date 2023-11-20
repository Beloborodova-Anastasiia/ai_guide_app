import 'package:json_annotation/json_annotation.dart';

part 'audio.g.dart';

@JsonSerializable()
class Audio {

  const Audio({
    required this.url,
  });

  factory Audio.fromJson(Map<String, dynamic> json) =>
      _$AudioFromJson(json);

  final String url;
}