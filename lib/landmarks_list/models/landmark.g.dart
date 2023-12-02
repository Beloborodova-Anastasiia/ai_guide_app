// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'landmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Landmark _$LandmarkFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Landmark',
      json,
      ($checkedConvert) {
        final val = Landmark(
          name: $checkedConvert('name', (v) => v as String),
          location: $checkedConvert('location', (v) => v as String),
          photo: $checkedConvert(
              'photo', (v) => Photo.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$LandmarkToJson(Landmark instance) => <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'photo': instance.photo.toJson(),
    };

Photo _$PhotoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Photo',
      json,
      ($checkedConvert) {
        final val = Photo(
          link: $checkedConvert('link', (v) => v as String),
          headers: $checkedConvert(
              'headers', (v) => Map<String, String>.from(v as Map)),
        );
        return val;
      },
    );

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'link': instance.link,
      'headers': instance.headers,
    };
