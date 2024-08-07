import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fetch_api_cubit/cubits/user_cubit.dart';
import 'package:flutter_fetch_api_cubit/screens/user_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: BlocProvider(
        create: (context) => UserCubit(),
        child: const UserScreen(),
      ),
    );
  }
}
