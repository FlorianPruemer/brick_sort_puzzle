import 'package:brick_sort_puzzle/providers/game_provider.dart';
import 'package:brick_sort_puzzle/widgets/brick_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrickStackWidget extends StatelessWidget {
  const BrickStackWidget(
      {super.key,
      required this.bricks,
      required this.index,
      required this.onTap});
  final List<BrickWidget> bricks;
  final int index;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Consumer<GameProvider>(builder: (context, provider, child) {
          return AnimatedSlide(
            offset: Offset(0, provider.stackIndex == index ? -0.1 : 0),
            duration: const Duration(milliseconds: 50),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3, 1],
                  colors: [Colors.white, Color(0xff1d2d44)],
                ),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              height: 160,
              width: 50,
              child: Column(
                  verticalDirection: VerticalDirection.up, children: bricks),
            ),
          );
        }),
      ),
    );
  }
}
