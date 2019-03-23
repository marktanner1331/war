import 'package:stagexl/src/display.dart';

abstract class MapBase {
  int _width;
  int _height;

  get width => _width;
  get height => _height;

  MapBase(int width, int height) {
    this._width = width;
    this._height = height;
  }

  Sprite drawMap();
}