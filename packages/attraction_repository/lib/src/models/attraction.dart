import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attraction.g.dart';

@JsonSerializable()
class Attraction extends Equatable {
  const Attraction({
    required this.id,
    required this.name,
    required this.description,
    required this.audioUrl,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) =>
      _$AttractionFromJson(json);

  Map<String, dynamic> toJson() => _$AttractionToJson(this);

  final int id;
  final String name;
  final String description;
  final String audioUrl;

  @override
  List<Object> get props => [id, name, description, audioUrl];
}
