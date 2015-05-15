package sxg;

import sxg.core.*;
import thx.geom.d2.Size;
import thx.geom.Matrix23;

class Element<T : {}> {
  public var el(default, null) : T;
  public var doc(default, null) : Document<T>;
  public var style(default, null) : Style<T>;
  public var transform(default, null) : Matrix23;
  public var id(get, set) : String;
  public var className(get, set) : String;
  var children : Map<T, Element<T>>;

  function new(doc : Document<T>, name : String) {
    this.doc = doc;
    this.el = createElement(name);
    this.style = new Style(doc, this.el);
    this.children = new Map();
    this.transform = Geom.linkedMatrix(doc, el, Matrix23.identity);
  }

  public function arc(cx : Float, cy : Float, startAngle : Float, endAngle : Float, startRadius : Float, endRadius : Float)
    return add(new Arc(doc, cx, cy, startAngle, endAngle, startRadius, endRadius));

  public function circle(cx : Float, cy : Float, radius : Float)
    return add(new Circle(doc, cx, cy, radius));

  public function clear() {
    for(element in children)
      remove(element);
  }

  public function group()
    return add(new Group(doc));

  public function path(d : String)
    return add(new Path(doc, d));

  public function rect(x : Float, y : Float, w : Float, h : Float)
    return add(new Rect(doc, x, y, w, h));

  public function text(x : Float, y : Float, text : String)
    return add(new Text(doc, x, y, text));

  public function add<TIn : Element<T>>(element : TIn) : TIn {
    doc.appendChild(el, element.el);
    children.set(element.el, element);
    return element;
  }

  public function remove<TIn : Element<T>>(element : TIn) : TIn {
    doc.removeChild(el, element.el);
    children.remove(element.el);
    return element;
  }

  public function toString()
    return doc.elementToString(el);

  inline function createElement(name : String)
    return doc.createElementNS(Svg.SVG, name);

  function get_id()
    return doc.getAttribute(el, "id");

  function set_id(v : String)
    return doc.setAttribute(el, "id", v);

  function get_className()
    return doc.getAttribute(el, "class");

  function set_className(v : String)
    return doc.setAttribute(el, "class", v);
}
