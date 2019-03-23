import 'package:stagexl/stagexl.dart';

class MapWindowMargin extends Sprite {
  MapWindowMargin() {
    graphics.rect(0, 0, 100, 100);
    graphics.fillColor(0x55000000);

    alpha = 0;

    onMouseOver.listen(onMousedOver);
    onMouseOut.listen(onMousedOut);
  }

  get isMouseOver => mouseX > 0 && mouseX < 100 && mouseY > 0 && mouseY < 100;

  void onMousedOver(MouseEvent e) {
    alpha = 1;
  }
  
  void onMousedOut(MouseEvent e) {
    alpha = 0;
  }
}