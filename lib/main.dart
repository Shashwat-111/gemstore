import 'package:flutter/material.dart';
import 'package:fluxstore/screens/main_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'FluxStore',

        /// for now adding the screen currently being worked on
        /// todo add navigation from go_router package
      home: HomeScreen()
    );
  }
}
