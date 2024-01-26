import 'package:brick_sort_puzzle/screens/game.dart';
import 'package:brick_sort_puzzle/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Brick Sort Puzzle',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const Home(),
          '/game': (context) => const Game(),
        },
        theme: ThemeData(
          fontFamily: 'Oswald',
        ));
  }
}
