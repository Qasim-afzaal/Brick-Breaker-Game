import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import 'paddle.dart';
import 'brick.dart';

class Ball extends PositionComponent {
  final Paddle paddle;
  final VoidCallback onBrickDestroyed;
  Vector2 velocity = Vector2(200, 200);

  Ball({required this.paddle, required this.onBrickDestroyed});

  @override
  void update(double dt) {
    position += velocity * dt;

    // Bounce off walls
    if (position.x <= 0 || position.x >= gameRef.size.x - size.x) {
      velocity.x = -velocity.x;
    }
    if (position.y <= 0) {
      velocity.y = -velocity.y;
    }

    // Game over
    if (position.y >= gameRef.size.y) {
      gameRef.pauseEngine();
    }

    // Bounce off paddle
    if (position.overlaps(paddle.toRect())) {
      velocity.y = -velocity.y;
      position.y = paddle.y - size.y; // Adjust position to avoid overlapping
    }

    // Check collision with bricks
    for (var brick in gameRef.children.whereType<Brick>()) {
      if (position.overlaps(brick.toRect())) {
        velocity.y = -velocity.y;
        gameRef.remove(brick);
        onBrickDestroyed();
        break;
      }
    }
  }

  @override
  void render(Canvas canvas) {
    canvas.drawOval(size.toRect(), Paint()..color = Colors.red);
  }
}
