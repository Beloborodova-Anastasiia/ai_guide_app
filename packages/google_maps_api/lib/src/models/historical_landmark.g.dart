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
        );
        return val;
      },
      fieldKeyMap: const {
        'formattedAddress': 'formattedAddress',
        'displayName': 'displayName',
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
