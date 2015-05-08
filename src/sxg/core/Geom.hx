package sxg.core;

import thx.geom.d2.*;

class Geom {
  public static function linkedSize<T>(doc : Document<T>, el : T, width : Float, height : Float)
    return Size.linked(
      doc.getFloatAttribute.bind(el, "width"),
      doc.getFloatAttribute.bind(el, "height"),
      doc.setFloatAttribute.bind(el, "width", _),
      doc.setFloatAttribute.bind(el, "height", _),
      width,
      height
    );
}
