import 'package:brick_sort_puzzle/widgets/game_button.dart';
import 'package:flutter/material.dart';
import 'custom_dialog.dart';

/// A dialog that prompts the user to confirm an action
class PromptDialog extends StatelessWidget {
  const PromptDialog({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              flex: 10,
              child: Text(
                text,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              )),
          const Spacer(),
          Flexible(
            flex: 10,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 10,
                  child: GameButton(
                    onPressed: () => Navigator.pop(context),
                    color: Colors.red,
                    label: "No",
                  ),
                ),
                const Spacer(flex: 3),
                Flexible(
                  flex: 10,
                  child: GameButton(
                      onPressed: onPressed, color: Colors.green, label: "Yes"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Future<void> openPromptDialog(
      BuildContext context, String text, VoidCallback onPressed) async {
    await showDialog<PromptDialog>(
      context: context,
      builder: (context) => PromptDialog(
        text: text,
        onPressed: onPressed,
      ),
    );
  }
}
