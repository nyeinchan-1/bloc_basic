part of 'counter_bloc.dart';


class CounterState extends Equatable{
  final int count;
  CounterState({ required this.count });

  factory CounterState.initial() {
    return CounterState(count: 0);
  }
  @override
  List<Object?> get props => [count];

  CounterState copyWith({int? count}) {
    return CounterState(count: count?? this.count);
  }
}