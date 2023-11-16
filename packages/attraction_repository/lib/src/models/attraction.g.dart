// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attraction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attraction _$AttractionFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Attraction',
      json,
      ($checkedConvert) {
        final val = Attraction(
          id: $checkedConvert('id', (v) => v as int),
          name: $checkedConvert('name', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          audioUrl: $checkedConvert('audio_url', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'audioUrl': 'audio_url'},
    );

Map<String, dynamic> _$AttractionToJson(Attraction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'audio_url': instance.audioUrl,
    };
