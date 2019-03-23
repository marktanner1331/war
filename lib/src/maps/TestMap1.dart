import 'package:stagexl/src/display.dart';

import '../MapBase.dart';

class TestMap1 extends MapBase {
  int maxPlayers = 2;

  TestMap1() : super(1000, 1000);

  @override
  Sprite drawMap() {
    Sprite map = new Sprite();
    map.graphics.rect(0, 0, 1000, 1000);
    map.graphics.fillColor(0xffdddddd);

    for (var i = 0; i < 1000; i += 50) {
        map.graphics.moveTo(0, i);
        map.graphics.lineTo(1000, i);
    }

    for (var i = 0; i < 1000; i += 50) {
        map.graphics.moveTo(i, 0);
        map.graphics.lineTo(i, 1000);
    }
    
    map.graphics.strokeColor(0xff000000, 1);

    return map;
  }
}