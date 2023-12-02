// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LandmarkRepo _$LandmarkRepoFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LandmarkRepo',
      json,
      ($checkedConvert) {
        final val = LandmarkRepo(
          name: $checkedConvert('name', (v) => v as String),
          location: $checkedConvert('location', (v) => v as String),
          photo: $checkedConvert(
              'photo', (v) => PhotoRepo.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$LandmarkRepoToJson(LandmarkRepo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'photo': instance.photo,
    };

PhotoRepo _$PhotoRepoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'PhotoRepo',
      json,
      ($checkedConvert) {
        final val = PhotoRepo(
          link: $checkedConvert('link', (v) => v as String),
          headers: $checkedConvert(
              'headers', (v) => Map<String, String>.from(v as Map)),
        );
        return val;
      },
    );

Map<String, dynamic> _$PhotoRepoToJson(PhotoRepo instance) => <String, dynamic>{
      'link': instance.link,
      'headers': instance.headers,
    };
