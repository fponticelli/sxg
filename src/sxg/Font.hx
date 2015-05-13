package sxg;

import sxg.core.Document;
import sxg.Element;

class Font<T> {
  var el : T;
  var doc : Document<T>;
  public function new(doc : Document<T>, el : T) {
    this.doc = doc;
    this.el = el;
  }

  public var family(get, set) : String;
  public var size(get, set) : Float;

  function get_family()
    return doc.getStyle(el, "font-family");

  function set_family(v : String)
    return doc.setStyle(el, "font-family", v);

  function get_size()
    return doc.getFloatStyle(el, "font-family");

  function set_size(v : Float)
    return doc.setFloatStyle(el, "font-size", v);
}
