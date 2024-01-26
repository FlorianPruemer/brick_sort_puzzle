import 'package:flutter/material.dart';

/// A button with different styling capabilities
class GameButton extends StatelessWidget {
  const GameButton(
      {super.key,
      required this.onPressed,
      required this.color,
      required this.label,
      this.bigButton = false,
      this.secondaryButton = false});
  final VoidCallback onPressed;
  final Color color;
  final String label;
  final bool bigButton;
  final bool secondaryButton;

  @override
  Widget build(BuildContext context) {
    Size minSize = bigButton ? const Size(150, 0) : const Size(100, 0);
    TextStyle textStyle = secondaryButton
        ? Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.black, fontWeight: FontWeight.w100)
        : Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Colors.white, fontWeight: FontWeight.w100);
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            minimumSize: MaterialStateProperty.all(minSize),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ))),
        onPressed: onPressed,
        child: Text(
          label,
          style: textStyle,
        ));
  }
}
