import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_cubit/counter_observer.dart';
import 'package:my_counter_cubit/cubit/counter_cubit.dart';

void main() {
  Bloc.observer = CounterObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
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
        body: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${context
                        .read<CounterCubit>()
                        .state
                        .count}',
                    style: TextStyle(fontSize: 32),
                  ),
                  SizedBox(height: 24,),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      child: Text('Increment')
                  )
                ],
              ),
            );
          },
        )
    );
  }
}

