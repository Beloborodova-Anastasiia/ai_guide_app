import 'package:json_annotation/json_annotation.dart';

part 'attraction.g.dart';

@JsonSerializable()
class Attraction {

  const Attraction({
    required this.id,
    required this.object_name,
    required this.location,
    required this.content,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) =>
      _$AttractionFromJson(json);

  final int id;
  final String object_name;
  final String location;
  final String content;
}