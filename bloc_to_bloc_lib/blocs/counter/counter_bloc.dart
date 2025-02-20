import 'dart:async';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';
part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(): super(CounterState.initial()) {

    on<ChangeCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + event.incrementSize));
    });
  }

}