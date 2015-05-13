package sxg;

import sxg.core.Geom;
import sxg.core.Document;
import thx.Functions;
import thx.geom.d2.*;
import thx.geom.d2.Circle as C;

class Circle<T : {}> extends Element<T> {
  public var shape(default, null) : C;
  function new(doc : Document<T>, cx : Float, cy : Float, radius : Float) {
    super(doc, "circle");

    this.shape = new C(
      Geom.linkedPosition(doc, el, "cx", "cy", cx, cy),
      Geom.linkedRadius(doc, el, radius)
    );
  }
}
