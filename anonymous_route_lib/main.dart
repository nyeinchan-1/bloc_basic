import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_cubit/cubit/counter_cubit.dart';
import 'package:my_counter_cubit/show_me_counter.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<CounterCubit>(create: (context) => CounterCubit(), child: const HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (routeContext) {
                      return BlocProvider.value(value: context.read<CounterCubit>(), child: ShowMeCounter(),);
                    })
                  );
                },
                child: Text('Show Counter Page')
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
      )
    );

  }
}

