import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
// import 'package:landmark_repository/landmark_repository.dart'
//     hide Landmark, Photo;
import 'package:landmark_repository/landmark_repository.dart'
as landmark_rep;

part 'landmark.g.dart';

@JsonSerializable()
class Landmark extends Equatable {
  const Landmark({
    required this.name,
    required this.location,
    required this.photo
  });

  factory Landmark.fromJson(Map<String, dynamic> json) =>
      _$LandmarkFromJson(json);

  factory Landmark.fromRepository(landmark_rep.LandmarkRepo landmark) {
    final Photo photo = Photo(link: landmark.photo.link, headers: landmark.photo.headers);
    // print('!!!!!!!!!!!!!!!!!');
    // print(landmark.photo.headers);
    return Landmark(
      name: landmark.name,
      location: landmark.location,
      photo: photo
    );
  }

  static final empty = Landmark(
    name: '',
    location: '',
    photo: Photo.empty
  );

  final String name;
  final String location;
  final Photo photo;

  @override
  List<Object?> get props => [name, location];

  Map<String, dynamic> toJson() => _$LandmarkToJson(this);

  Landmark copyWith({
    String? name,
    String? location,
    Photo? photo,
  }) {
    return Landmark(
      name: name ?? this.name,
      location: location ?? this.location,
      photo:  photo ?? this.photo,
    );
  }
}

@JsonSerializable()
class Photo extends Equatable {
  const Photo({
    required this.link,
    required this.headers,
  });

  static final empty = Photo(
    link: '',
    headers: {},
  );

  final String link;
  final Map<String, String> headers;

  @override
  List<Object?> get props => [link, headers];

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
  factory Photo.fromJson(Map<String, dynamic> json) =>
      _$PhotoFromJson(json);

  Photo copyWith({
    String? link,
    Map<String, String>? headers,
  }) {
    return Photo(
      link: link ?? this.link,
      headers: headers ?? this.headers,
    );
  }
}

