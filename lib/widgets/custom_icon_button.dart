import 'package:flutter/material.dart';

/// A custom icon button to ensure consistent styling
class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.onPressed,
    required this.iconData,
    this.iconSize,
    this.iconColor,
  }) : super(key: key);
  final VoidCallback onPressed;
  final IconData iconData;
  final double? iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        iconData,
        color: iconColor ?? Colors.white,
      ),
      iconSize: iconSize,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}
