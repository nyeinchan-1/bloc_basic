import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_cubit/cubit/counter_cubit.dart';
import 'package:my_counter_cubit/show_me_counter.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routes: {
      //   '/': (context) => BlocProvider.value(value: _counterCubit, child: HomePage()),
      //   '/counter': (context) => BlocProvider.value(value: _counterCubit, child: ShowMeCounter())
      // },
      onGenerateRoute: (RouteSettings settings) {
        switch(settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (context) => BlocProvider.value(value: _counterCubit, child: HomePage())
            );
          case '/counter':
            return MaterialPageRoute(
              builder: (context) => BlocProvider.value(value: _counterCubit, child: ShowMeCounter())
            );
          default:
            return null;
        }
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
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
                  Navigator.pushNamed(
                    context,
                    '/counter'
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

