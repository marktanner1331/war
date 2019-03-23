import 'package:stagexl/stagexl.dart';
import 'package:stagexl_ui_components/ui_components.dart';

import './MapWindow.dart';
import '../maps/TestMap1.dart';

class MainWindow extends Sprite with RefreshMixin, SetSizeAndPositionMixin {
  MapWindow mapWindow;

  MainWindow() {
    this.mapWindow = MapWindow();
    addChild(mapWindow);
  }

  void loadTestMap() {
    mapWindow.loadMap(TestMap1());
    mapWindow.setZoom(500);
  }

  @override
  void refresh() {
    mapWindow.setSize(width, height);
  }
}