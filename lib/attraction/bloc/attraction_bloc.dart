import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ai_guide/attraction/models/attraction.dart';
import 'package:ai_guide/attraction/attraction.dart';
import 'package:attraction_repository/attraction_repository.dart' show AttractionRepository;

part 'attraction_event.dart';
part 'attraction_state.dart';

class AttractionBloc extends Bloc<AttractionEvent, AttractionState> {
  AttractionBloc({required AttractionRepository attractionRepository})
      : _attractionRepository = attractionRepository,
        super(AttractionState()) {

    on<GetAttractionEvent>(_onAttraction);
  }
  late final AttractionRepository _attractionRepository;

  _onAttraction(GetAttractionEvent event, Emitter<AttractionState> emit) async {
    emit(state.copyWith(isLoading: true));
    final attraction  = Attraction.fromRepository(
      await _attractionRepository.getAttraction(
        name: event.name,
        location: event.location
      ),
    );
    print(event.name);
    print(event.location);
    emit(state.copyWith(attraction: attraction));
  }

}
