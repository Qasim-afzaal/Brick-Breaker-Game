import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

import 'paddle.dart';
import 'ball.dart';
import 'brick.dart';

class BrickBreakerGame extends FlameGame with HasDraggableComponents {
  late Paddle paddle;
  late Ball ball;
  int score = 0;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Add background color
    camera.viewport.backgroundColor = const Color(0xFF222222);

    // Add paddle
    paddle = Paddle()
      ..position = Vector2(size.x / 2 - 50, size.y - 30)
      ..size = Vector2(100, 20);
    add(paddle);

    // Add ball
    ball = Ball(paddle: paddle, onBrickDestroyed: () {
      score += 10;
    })
      ..position = Vector2(size.x / 2, size.y / 2)
      ..size = Vector2(20, 20);
    add(ball);

    // Add bricks
    addAll(_generateBricks());

    // Add score text
    add(ScoreText(() => score));
  }

  List<Brick> _generateBricks() {
    List<Brick> bricks = [];
    double brickWidth = 60.0;
    double brickHeight = 20.0;
    for (int row = 0; row < 5; row++) {
      for (int col = 0; col < size.x ~/ brickWidth; col++) {
        bricks.add(Brick()
          ..position = Vector2(col * (brickWidth + 5), row * (brickHeight + 5))
          ..size = Vector2(brickWidth, brickHeight));
      }
    }
    return bricks;
  }
}
