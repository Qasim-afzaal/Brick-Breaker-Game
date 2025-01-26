import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class Paddle extends PositionComponent with Draggable {
  @override
  void render(Canvas canvas) {
    canvas.drawRect(size.toRect(), Paint()..color = Colors.blue);
  }

  @override
  bool onDragUpdate(DragUpdateInfo info) {
    position.x += info.delta.global.x;

    // Keep paddle within screen bounds
    position.x = position.x.clamp(0, gameRef.size.x - size.x);
    return true;
  }
}
