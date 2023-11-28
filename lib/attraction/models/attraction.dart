import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:attraction_repository/attraction_repository.dart'
    hide Attraction;
import 'package:attraction_repository/attraction_repository.dart'
    as attr_repository;

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

  factory Attraction.fromRepository(attr_repository.Attraction attraction) {

    return Attraction(
      id: attraction.id,
      name: attraction.name,
      description: attraction.description,
      audioUrl: attraction.audioUrl,
    );
  }

  static final empty = const Attraction(
    id: 0,
    name: '',
    description: '',
    audioUrl: '',
  );

  final int id;
  final String name;
  final String description;
  final String audioUrl;

  @override
  List<Object?> get props => [id, name, description, audioUrl];

  Map<String, dynamic> toJson() => _$AttractionToJson(this);

  Attraction copyWith({
    int? id,
    String? name,
    String? description,
    String? audioUrl,
  }) {
    return Attraction(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        audioUrl: audioUrl ?? this.audioUrl,
    );
  }
}
