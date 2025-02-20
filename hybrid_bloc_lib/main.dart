import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:my_counter_cubit/blocs/theme/theme_bloc.dart';
import 'package:my_counter_cubit/counter_observer.dart';
import 'package:path_provider/path_provider.dart';

import 'blocs/counter/counter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: kIsWeb
    ? HydratedStorage.webStorageDirectory
    : await getApplicationDocumentsDirectory()
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc())
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return MaterialApp(
            title: 'Hydrated Bloc',
            theme: state.appTheme == AppTheme.light
              ? ThemeData.light()
              : ThemeData.dark(),
            home: HomePage(),
          );
        },
      )
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
          FloatingActionButton(
              onPressed: () {
                BlocProvider.of<ThemeBloc>(context).add(ToggleThemeEvent());
              },

              child: const Icon(Icons.brightness_6)
          ),
          SizedBox(width: 8,),
          FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(IncreaseCounterEvent());
              },
              
              child: const Icon(Icons.add)
          ),
          SizedBox(width: 8,),
          FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(DecrementCounterEvent());
              },
              child: const Icon(Icons.remove)
          ),
          SizedBox(width: 8,),
          FloatingActionButton(
              onPressed: () {
                HydratedBloc.storage.clear();
              },
              child: const Icon(Icons.delete_forever)
          )

        ],
      ),
    );
  }
}

