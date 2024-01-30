import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/common/themes/dark_theme.dart';
import 'package:practice/common/themes/light_theme.dart';
import 'package:practice/counter_cubit/counter_cubit.dart';
import 'package:practice/home_view.dart';
import 'package:practice/lock_cubit/lock_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
        home: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => LockCubit(),
        )
      ],
      child: const HomeView(),
    ));
  }
}
