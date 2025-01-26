import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ScoreText extends TextComponent {
  final int Function() scoreGetter;

  ScoreText(this.scoreGetter) : super(priority: 1);

  @override
  void update(double dt) {
    text = 'Score: ${scoreGetter()}';
  }

  @override
  Future<void> onLoad() async {
    textRenderer = TextPaint(
      style: const TextStyle(
        fontSize: 24,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
    position = Vector2(10, 10);
  }
}
