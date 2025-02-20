import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<IncreaseCounterEvent>(_incrementCounter);
    on<DecrementCounterEvent>(_decrementCounter);
  }


  Future<void> _incrementCounter(
    IncreaseCounterEvent event,
    Emitter<CounterState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 4));
    emit(state.copyWith(count: state.count + 1));
  }

  Future<void> _decrementCounter(
    DecrementCounterEvent event,
    Emitter<CounterState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 4));
    emit(state.copyWith(count: state.count - 1));
  }
}
