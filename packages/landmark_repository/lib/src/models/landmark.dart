import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'landmark.g.dart';

@JsonSerializable()
class LandmarkRepo extends Equatable {
  const LandmarkRepo({
    required this.name,
    required this.location,
    // this.photo = const PhotoRepo('', {}),
    required this.photo
  });

  factory LandmarkRepo.fromJson(Map<String, dynamic> json) =>
      _$LandmarkRepoFromJson(json);

  Map<String, dynamic> toJson() => _$LandmarkRepoToJson(this);

  final String name;
  final String location;
  final PhotoRepo photo;

  @override
  List<Object> get props => [name, location, photo];
}


@JsonSerializable()
class PhotoRepo extends Equatable{
  const PhotoRepo({
    required this.link,
    required this.headers,
  });

  factory PhotoRepo.fromJson(Map<String, dynamic> json) =>
      _$PhotoRepoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoRepoToJson(this);

  final String link;
  final Map<String, String> headers;

  @override
  List<Object> get props => [link, headers];
}