import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_cubit/cubit/counter_cubit.dart';

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter'),),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (BuildContext context, CounterState state) {
            return Text(
              '${state.count}',
              style: TextStyle(fontSize: 32),
            );
          },
        ),
      ),
    );
  }
}
