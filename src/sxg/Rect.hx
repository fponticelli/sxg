package sxg;

import sxg.core.Geom;
import thx.geom.d2.*;
import thx.geom.d2.Rect as R;

class Rect<T> extends Element<T> {
  public var shape(default, null) : R;
  function new(doc : sxg.core.Document<T>, x : Float, y : Float, w : Float, h : Float) {
    super(doc, "rect");
    this.shape = new R(
      Geom.linkedPosition(doc, el, x, y),
      Geom.linkedSize(doc, el, w, h)
    );
  }
}
