import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'attraction_event.dart';
part 'attraction_state.dart';

class AttractionBloc extends Bloc<AttractionEvent, AttractionState> {
  AttractionBloc() : super(AttractionInitial()) {
    on<AttractionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
