import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class config {
  static double width = 1;
  static double height = 1;
  static double blocksizevert = 0;
  static double blocksizehoriz = 0;
  static double imagesize = 0;
  static double heightmultiplier = 0;

  // ignore: avoid_types_as_parameter_names
  void lize(BoxConstraints constraints, Orientation orientation) {
    double textmultiplier;
    if (orientation == Orientation.portrait) {
      width = constraints.maxWidth;
      height = constraints.maxHeight;
    } else {
      width = constraints.maxHeight;
      height = constraints.maxWidth;
    }
    blocksizevert = width / 100;
    blocksizehoriz = height / 100;
    textmultiplier = blocksizevert;
    imagesize = blocksizehoriz;
    heightmultiplier = blocksizevert;
    print(blocksizehoriz);
    print(blocksizevert);
  }
}
