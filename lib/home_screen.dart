import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';

import 'models/point.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // late Point point;

  List<Point> points = [];
  int numberOfPoints = 15;

  final int tilesPerRow = 30;
  final int tilesPerColumn = 50;

  @override
  void initState() {
    super.initState();

    points = List<Point>.generate(numberOfPoints, (index) {
      return Point(
        x: Random().nextInt(tilesPerRow),
        y: Random().nextInt(tilesPerColumn),
        xBoundary: tilesPerRow,
        yBoundary: tilesPerColumn,
        color: Colors.accents[index],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double tileWidth = size.width / tilesPerRow;
    double tileHeight = size.height / tilesPerColumn;

    return Scaffold(
      backgroundColor: Colors.black,
      body: TimerBuilder.periodic(
        const Duration(milliseconds: 50),
        builder: (context) {
          for (Point point in points) {
            point.move();
          }
          return drawGrid(tileWidth, tileHeight);
        },
      ),
    );
  }

  Column drawGrid(double tileWidth, double tileHeight) {
    return Column(
      children: List<Row>.generate(
        tilesPerColumn,
        (columnIndex) {
          return Row(
            children: List<Container>.generate(
              tilesPerRow,
              (rowIndex) {
                Color fillColor = Colors.black;

                for (Point point in points) {
                  if (point.x == rowIndex && point.y == columnIndex) {
                    fillColor = point.color;
                  }
                }

                return Container(
                  width: tileWidth,
                  height: tileHeight,
                  decoration: BoxDecoration(
                    color: fillColor,
                    shape: BoxShape.circle,
                    // border: Border.all(
                    //   color: Colors.white,
                    //   width: 1,
                    // ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
