import 'package:flutter/material.dart';
import 'package:fluxstore/screens/main_scaffold.dart';
import 'package:fluxstore/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'FluxStore',
        theme: lightTheme,

        /// for now adding the screen currently being worked on
        /// todo add navigation from go_router package
      home: const HomeScreen()
    );
  }
}
