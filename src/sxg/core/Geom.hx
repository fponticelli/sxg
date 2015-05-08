package sxg.core;

import thx.geom.d2.*;

class Geom {
  public static function linkedSize<T>(doc : Document<T>, el : T, width : Float, height : Float) {
    var size = Size.create(0, 0);

    size.width = width;
    size.height = height;
    return size;
  }
}
