import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(): super(CounterState.initial());

  void increment() {
    emit(state.copyWith(count: state.count + 1));
  }

}