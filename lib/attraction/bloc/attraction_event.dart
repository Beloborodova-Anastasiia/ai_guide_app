part of 'attraction_bloc.dart';

@immutable
abstract class AttractionEvent {}

class GetAttractionEvent extends AttractionEvent {
  final String name;
  final String location;

  GetAttractionEvent({required this.name, required this.location});
}


