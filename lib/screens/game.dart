import 'package:brick_sort_puzzle/providers/game_provider.dart';
import 'package:brick_sort_puzzle/widgets/brick_stack_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff1d2d44), Color(0xff0d1321)],
        ),
      ),
      child: ChangeNotifierProvider(
        create: (BuildContext context) => GameProvider(),
        child: Consumer<GameProvider>(builder: (context, provider, child) {
          List<BrickStackWidget> brickStackWidgets =
              provider.createBrickStackWidgetList(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [...getGameElements(brickStackWidgets)],
          );
        }),
      ),
    );
  }

  List<Widget> getGameElements(List<BrickStackWidget> brickStackWidgets) {
    const int rowFlex = 3;
    return [
      Flexible(
        flex: rowFlex,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: brickStackWidgets.getRange(0, 4).toList()),
      ),
      const Spacer(),
      Flexible(
        flex: rowFlex,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: brickStackWidgets.getRange(4, 8).toList()),
      ),
      const Spacer(),
      Flexible(
        flex: rowFlex,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: brickStackWidgets.getRange(8, 13).toList()),
      ),
      const Spacer(),
    ];
  }
}
