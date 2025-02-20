import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/color/color_bloc.dart';
import 'blocs/counter/counter_bloc.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(create: (context)=> ColorBloc()),
        BlocProvider<CounterBloc>(create: (context)=> CounterBloc())
      ],
      child: MaterialApp(
        title: 'Cubit to Cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int incrementSize = 1;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorBloc, ColorState>(
      listener: (BuildContext context, ColorState state) {
        if (state.color == Colors.red) {
          incrementSize = 1;
        } else if (state.color == Colors.green) {
          incrementSize = 10;
        } else if (state.color == Colors.blue) {
          incrementSize = 100;
        } else if (state.color == Colors.black) {
          // context.read<CounterCubit>().changeCounter(-100);
          context.read<CounterBloc>().add(ChangeCounterEvent(incrementSize: incrementSize));
          incrementSize = -100;
        }
      },
      child: Scaffold(
        backgroundColor: context.watch<ColorBloc>().state.color,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // context.read<ColorCubit>().ChangeColor();
                    context.read<ColorBloc>().add(ChangeColorEvent());
                  },
                  child: Text(
                    'Change Color',
                    style: TextStyle(fontSize: 24),
                  )
              ),
              SizedBox(height: 20,),
              Text(
                '${context.watch<CounterBloc>().state.counter}',
                style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(ChangeCounterEvent(incrementSize: incrementSize));
                  },
                  child: Text(
                    'Increment Counter',
                    style: TextStyle(fontSize: 24),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}






