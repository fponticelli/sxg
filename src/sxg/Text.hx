package sxg;

import sxg.core.Geom;
import sxg.core.Document;
import thx.geom.d2.*;

class Text<T : {}> extends Element<T> {
  public var text(get, set) : String;
  public var position(default, null) : Point;
  function new(doc : Document<T>, x : Float, y : Float, text : String) {
    super(doc, "text");
    this.text = text;
    Geom.linkedPosition(doc, el, x, y);
  }

  function get_text() return doc.getTextContent(el);
  function set_text(t : String) {
    doc.setTextContent(el, t);
    return t;
  }
}
