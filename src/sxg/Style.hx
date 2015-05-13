package sxg;

import sxg.core.Document;
import sxg.Element;
using sxg.Paint;

class Style<T> {
  var el : T;
  var doc : Document<T>;
  public function new(doc : Document<T>, el : T) {
    this.doc = doc;
    this.el = el;
  }

  public var fill(get, set) : Paint;
  public var stroke(get, set) : Paint;
  public var strokeWidth : Null<Float>;

  function get_fill()
    return Paints.getPaint(doc, el, "fill", true);

  function set_fill(v : Paint) {
    v.apply(doc, el, "fill", true);
    return v;
  }

  function get_stroke()
    return Paints.getPaint(doc, el, "stroke", true);

  function set_stroke(v : Paint) {
    v.apply(doc, el, "stroke", true);
    return v;
  }

  function get_strokeWidth()
    return Paints.getPaint(doc, el, "stroke", true);

  function set_strokeWidth(v : Null<Float>) {
    doc.setFloatStyle(el, "stroke-width", v);
    return v;
  }
}
