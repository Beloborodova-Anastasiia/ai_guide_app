import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'landmark.g.dart';

@JsonSerializable()
class Landmark extends Equatable {
  const Landmark({
    required this.name,
    required this.location,
  });

  factory Landmark.fromJson(Map<String, dynamic> json) =>
      _$LandmarkFromJson(json);

  Map<String, dynamic> toJson() => _$LandmarkToJson(this);

  final String name;
  final String location;

  @override
  List<Object> get props => [name, location];
}
