import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Brick extends PositionComponent {
  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), Paint()..color = Colors.green);
  }
}
