// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'historical_landmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoricalLandmark _$HistoricalLandmarkFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'HistoricalLandmark',
      json,
      ($checkedConvert) {
        final val = HistoricalLandmark(
          formattedAddress:
              $checkedConvert('formattedAddress', (v) => v as String),
          displayName: $checkedConvert('displayName',
              (v) => DisplayName.fromJson(v as Map<String, dynamic>)),
          photos: $checkedConvert(
              'photos',
              (v) => ((v ?? []) as List<dynamic>)
                  .map((e) => Photo.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'formattedAddress': 'formattedAddress',
        'displayName': 'displayName'
      },
    );

DisplayName _$DisplayNameFromJson(Map<String, dynamic> json) => $checkedCreate(
      'DisplayName',
      json,
      ($checkedConvert) {
        final val = DisplayName(
          text: $checkedConvert('text', (v) => v as String),
          languageCode: $checkedConvert('languageCode', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'languageCode': 'languageCode'},
    );

AuthorAttribution _$AuthorAttributionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AuthorAttribution',
      json,
      ($checkedConvert) {
        final val = AuthorAttribution(
          displayName: $checkedConvert('displayName', (v) => v as String),
          uri: $checkedConvert('uri', (v) => v as String),
          photoUri: $checkedConvert('photoUri', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'displayName': 'displayName',
        'photoUri': 'photoUri'
      },
    );

Photo _$PhotoFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Photo',
      json,
      ($checkedConvert) {
        final val = Photo(
          name: $checkedConvert('name', (v) => v as String),
          widthPx: $checkedConvert('widthPx', (v) => v as int),
          heightPx: $checkedConvert('heightPx', (v) => v as int),
          authorAttributions: $checkedConvert(
              'authorAttributions',
              (v) => (v as List<dynamic>)
                  .map((e) =>
                      AuthorAttribution.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'widthPx': 'widthPx',
        'heightPx': 'heightPx',
        'authorAttributions': 'authorAttributions'
      },
    );
