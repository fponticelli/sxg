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

  public static function linkedPosition<T>(doc : Document<T>, el : T, xname = "x", yname = "y", x : Float, y : Float)
    return Point.linked(
      doc.getFloatAttribute.bind(el, xname),
      doc.getFloatAttribute.bind(el, yname),
      doc.setFloatAttribute.bind(el, xname, _),
      doc.setFloatAttribute.bind(el, yname, _),
      x,
      y
    );

  public static function linkedRadius<T>(doc : Document<T>, el : T, radius : Float)
    return Radius.linked(
      doc.getFloatAttribute.bind(el, "r"),
      doc.setFloatAttribute.bind(el, "r", _),
      radius
    );
}
