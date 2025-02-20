import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_cubit/bloc/counter_bloc.dart';
import 'package:my_counter_cubit/counter_observer.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${context
                      .read<CounterBloc>()
                      .state
                      .count}',
                  style: TextStyle(fontSize: 32),
                ),
                SizedBox(height: 24,),


              ],
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(IncreaseCounterEvent());
              },
              child: Text('Increment')
          ),
          SizedBox(width: 24,),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(DecrementCounterEvent());
              },
              child: Text('Decrement')
          )
        ],
      ),
    );
  }
}

