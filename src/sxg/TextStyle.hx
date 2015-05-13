package sxg;

import sxg.core.Document;
import sxg.Element;
//using sxg.Paint;

class TextStyle<T> {
  var el : T;
  var doc : Document<T>;
  public function new(doc : Document<T>, el : T) {
    this.doc = doc;
    this.el = el;
  }

  public var fontFamily(get, set) : String;
  public var fontSize(get, set) : Float;

  function get_fontFamily()
    return doc.getStyle(el, "font-family");

  function set_fontFamily(v : String)
    return doc.setStyle(el, "font-family", v);

  function get_fontSize()
    return doc.getFloatStyle(el, "font-family");

  function set_fontSize(v : Float)
    return doc.setFloatStyle(el, "font-family", v);
}
