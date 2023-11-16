part of 'attraction_bloc.dart';

@immutable
abstract class AttractionEvent {}

class GetAttractionEvent extends AttractionEvent {
  final String query;

  GetAttractionEvent(this.query);
}


