import 'dart:async';
import 'dart:html' as html;
import 'package:stagexl/stagexl.dart';
import 'package:War/War.dart';

Stage stage;
MainWindow mapWindow;

Future<Null> main() async {
  StageOptions options = StageOptions()
    ..backgroundColor = Color.White
    ..renderEngine = RenderEngine.WebGL
    ..stageAlign = StageAlign.TOP_LEFT
    ..stageScaleMode = StageScaleMode.NO_SCALE;

  var canvas = html.querySelector('#stage');
  stage = Stage(canvas, width: 1280, height: 800, options: options);

  var renderLoop = RenderLoop();
  renderLoop.addStage(stage);

  mapWindow = MainWindow();
  mapWindow.loadTestMap();
  stage.addChild(mapWindow);

  stage.onResize.listen(onResize);
  onResize(null);
}

void onResize(Event e) {
  mapWindow.setSize(stage.stageWidth, stage.stageHeight);
}
