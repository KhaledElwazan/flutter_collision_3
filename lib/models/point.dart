import 'package:flutter/material.dart';

class Point {
  int x;
  int y;
  int xBoundary;
  int yBoundary;
  Color color;

  int xDirection = 1;
  int yDirection = 1;

  Point({
    required this.x,
    required this.y,
    required this.xBoundary,
    required this.yBoundary,
    required this.color,
  });

  @override
  String toString() => 'Point($x, $y)';

  void move() {
    checkHitBoundary();
    x = x + xDirection;
    y = y + yDirection;
  }

  void reverseXDirection() {
    xDirection = -xDirection;
  }

  void reverseYDirection() {
    yDirection = -yDirection;
  }

  void checkHitBoundary() {
    if (x >= xBoundary && xDirection == 1) {
      reverseXDirection();
    }

    if (x <= 0 && xDirection == -1) {
      reverseXDirection();
    }

    if (y >= yBoundary && yDirection == 1) {
      reverseYDirection();
    }

    if (y <= 0 && yDirection == -1) {
      reverseYDirection();
    }
  }
}
