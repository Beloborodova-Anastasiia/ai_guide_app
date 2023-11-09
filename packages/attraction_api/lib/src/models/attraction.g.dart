// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

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
          object_name: $checkedConvert('object_name', (v) => v as String),
          location: $checkedConvert('location', (v) => v as String),
          content: $checkedConvert('content', (v) => v as String),
        );
        return val;
      },
    );
