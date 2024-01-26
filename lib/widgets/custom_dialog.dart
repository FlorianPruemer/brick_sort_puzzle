import 'package:flutter/material.dart';

/// A wrapper around dialogs to ensure consistent styling
class CustomDialog extends StatelessWidget {
  const CustomDialog({
    Key? key,
    required this.content,
  }) : super(key: key);
  final Widget content;

  @override
  Widget build(BuildContext context) {
    const double outerPadding = 40;
    return Dialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: outerPadding,
              right: outerPadding,
              top: outerPadding,
              bottom: outerPadding / 2),
          child: content,
        ));
  }
}
