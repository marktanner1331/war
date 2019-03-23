import 'package:stagexl/stagexl.dart';
import 'package:stagexl_ui_components/ui_components.dart';
import '../MapBase.dart';
import './MapWindowMargin.dart';

class MapWindow extends Sprite with RefreshMixin, SetSizeAndPositionMixin {
  MapBase _map;
  Sprite _mapLayer;

  MapWindowMargin leftMargin;
  MapWindowMargin rightMargin;

  MapWindow() {
    leftMargin = MapWindowMargin();
    addChild(leftMargin);

    rightMargin =MapWindowMargin();
    addChild(rightMargin);

    this.onEnterFrame.listen(onEnteredFrame);
  }

  void onEnteredFrame(Event e) {
    checkMouseBoundsAndMoveMap();
  }

  void checkMouseBoundsAndMoveMap() {
    if (leftMargin.isMouseOver) {
      if (_mapLayer.x < 0) {
        _mapLayer.x += 10;
      }
    }

    if (rightMargin.isMouseOver) {
      if (_mapLayer.x > width - _mapLayer.width) {
        _mapLayer.x -= 10;
      }
    }
  }

  void loadMap(MapBase map) {
    this._map = map;

    if (_mapLayer != null) {
      removeChild(_mapLayer);
      _mapLayer = null;
    }

    _mapLayer = map.drawMap();
    addChildAt(_mapLayer, 0);
    addChild(leftMargin);
  }

  //sets the zoom relative to the width of the map
  //e.g. if the map has a width of 100, and 50 is passed then half of the map will be visible
  void setZoom(int mapUnitsVisibleInWidth) {
    num percent = _map.width / mapUnitsVisibleInWidth;
    _mapLayer.scaleX = percent;
    _mapLayer.scaleY = percent;
  }

  @override
  void refresh() {
    leftMargin.width = width / 20;
    leftMargin.height = height;

    rightMargin.width = width / 20;
    rightMargin.height = height;
    rightMargin.x = width - rightMargin.width;
  }
}
