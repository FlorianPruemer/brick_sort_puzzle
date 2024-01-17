import 'package:brick_sort_puzzle/widgets/brick_stack_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Brick Sort Puzzle',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: BrickStackWidget(),
      )),
    );
  }
}
