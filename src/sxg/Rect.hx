package sxg;

import thx.geom.d2.*;
import thx.geom.d2.Rect as R;

class Rect<T> extends Element<T> {
  public var shape(default, null) : R;
  function new(doc : sxg.core.Document<T>) {
    super(doc, "rect");
    /*
    this.shape = new R(

    );
    */
  }
}
