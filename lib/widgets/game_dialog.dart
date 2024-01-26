import 'package:flutter/material.dart';
import 'custom_dialog.dart';

/// A dialog shown when the game is either lost or won
class GameDialog extends StatelessWidget {
  const GameDialog({Key? key, required this.gameWon}) : super(key: key);

  final bool gameWon;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
      Flexible(
        flex: 10,
        child: Text(
          gameWon ? "You won!" : "You lost :(",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: Colors.black, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
      ),
      const Spacer(),
      Flexible(
          flex: 10,
          child: SizedBox(
              width: 50,
              child: Image.asset(gameWon
                  ? 'assets/images/in-love.png'
                  : 'assets/images/sad.png'))),
    ]));
  }

  static Future<void> openGameDialog(BuildContext context, bool gameWon) async {
    await showDialog<GameDialog>(
      context: context,
      builder: (context) => GameDialog(
        gameWon: gameWon,
      ),
    );
  }
}
