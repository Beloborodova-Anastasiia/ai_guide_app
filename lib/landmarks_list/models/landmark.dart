import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:landmark_repository/landmark_repository.dart'
    hide Landmark;
import 'package:landmark_repository/landmark_repository.dart'
as landmark_rep;

part 'landmark.g.dart';

@JsonSerializable()
class Landmark extends Equatable {
  const Landmark({
    required this.name,
    required this.location,
  });

  factory Landmark.fromJson(Map<String, dynamic> json) =>
      _$LandmarkFromJson(json);

  factory Landmark.fromRepository(landmark_rep.Landmark landmark) {
    return Landmark(
      name: landmark.name,
      location: landmark.location,
    );
  }

  static final empty = const Landmark(
    name: '',
    location: '',
  );

  final String name;
  final String location;

  @override
  List<Object?> get props => [name, location];

  Map<String, dynamic> toJson() => _$LandmarkToJson(this);

  Landmark copyWith({
    String? name,
    String? location,
  }) {
    return Landmark(
      name: name ?? this.name,
      location: location ?? this.location,
    );
  }
}
