package sxg;

import sxg.core.*;
import thx.geom.d2.Size;

class Element<T> {
  public var el(default, null) : T;
  public var doc(default, null) : Document<T>;

  function new(doc : Document<T>, name : String) {
    this.doc = doc;
    this.el = createElement(name);
  }

  public function arc(cx : Float, cy : Float, startAngle : Float, endAngle : Float, startRadius : Float, endRadius : Float)
    return add(new Arc(doc, cx, cy, startAngle, endAngle, startRadius, endRadius));

  public function circle(cx : Float, cy : Float, radius : Float)
    return add(new Circle(doc, cx, cy, radius));

  public function rect(x : Float, y : Float, w : Float, h : Float)
    return add(new Rect(doc, x, y, w, h));

  public function add<TIn : Element<T>>(svg : TIn) : TIn {
    doc.appendChild(el, svg.el);
    return svg;
  }

  public function remove<TIn : Element<T>>(svg : TIn) : TIn {
    doc.removeChild(el, svg.el);
    return svg;
  }

  public function toString()
    return doc.elementToString(el);

  inline function createElement(name : String)
    return doc.createElementNS(Svg.SVG, name);
}
