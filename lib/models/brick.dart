import 'package:meta/meta.dart';

/// Represents a single brick in the game.
@immutable
class Brick {
  /// The color index of the brick. See decoration.dart for more info.
  final int colorIndex;

  const Brick({required this.colorIndex});

  @override
  String toString() {
    return colorIndex.toString();
  }
}
