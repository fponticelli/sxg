package sxg;

import sxg.core.Geom;
import sxg.core.Document;
import thx.geom.d2.*;

class Text<T : {}> extends Element<T> {
  public var content(get, set) : String;
  public var position(default, null) : Point;
  function new(doc : Document<T>, x : Float, y : Float, content : String) {
    super(doc, "text");
    this.content = content;
    Geom.linkedPosition(doc, el, x, y);
  }

  function get_content() return doc.getTextContent(el);
  function set_content(t : String) {
    doc.setTextContent(el, t);
    return t;
  }
}
