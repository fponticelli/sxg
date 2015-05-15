package sxg;

import sxg.core.Document;
import sxg.core.Geom;
import thx.geom.d2.*;

class Pattern<T : {}> extends Element<T> {
  public var position(default, null) : Point;
  public var size(default, null) : Size;

  public function new(doc : Document<T>, id : String, x : Float, y : Float, width : Float, height : Float) {
    super(doc, "pattern");
    this.id = id;
    position = Geom.linkedPosition(doc, el, "x", "y", x, y);
    size = Geom.linkedSize(doc, el, width, height);
    doc.setAttribute(el, "patternUnits", "userSpaceOnUse");
  }
}
