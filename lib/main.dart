import 'package:flutter/material.dart';
import 'package:fluxstore/auth/log_in.dart';
import 'package:fluxstore/auth/sign_up.dart';
import 'package:fluxstore/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FluxStore',
      theme: ThemeData(
        splashColor: Colors.transparent,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen()
    );
  }
}
