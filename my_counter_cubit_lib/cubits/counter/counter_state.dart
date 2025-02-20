part of 'counter_cubit.dart';

class CounterState extends Equatable {
  CounterState({
    required this.counter
  });
  final int counter;

  factory CounterState.initial() {
    return CounterState(counter: 0);
  }


  @override
  // TODO: implement props
  List<Object?> get props => [counter];


  @override
  String toString() {
    // TODO: implement toString
    return 'CounterState(counter: $counter)';
  }

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(counter: counter ?? this.counter);
  }
}