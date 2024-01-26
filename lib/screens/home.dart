import 'package:brick_sort_puzzle/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:brick_sort_puzzle/helpers/decoration.dart' as decoration;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: decoration.backgroundDecoration,
        child: Center(
          child: CustomIconButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/game'),
            iconData: Icons.play_arrow_rounded,
            iconSize: 200,
          ),
        ),
      ),
    );
  }
}
