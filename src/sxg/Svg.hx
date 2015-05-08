package sxg;

import sxg.core.*;

class Svg<T> {
  public inline static var SVG   = 'http://www.w3.org/2000/svg';
  public inline static var XMLNS = 'http://www.w3.org/2000/xmlns/';
  public inline static var XLINK = 'http://www.w3.org/1999/xlink';

  public static function xml() : Svg<Xml>
    return new Svg(new XmlDocument(), "svg");

  #if js
  public static function dom(?document : js.html.Document) : Svg<js.html.Element>
    return new Svg(new DomDocument(document), "svg");
  #end

  var doc : Document<T>;
  var el : T;
  function new(doc : Document<T>, name : String) {
    this.doc = doc;
    this.el = createElement(name);
  }

  public function rect() {
    var r = new Rect(doc);
    //el.appendChild(r.el);
    return r;
  }

  public function toString() {
    return doc.elementToString(el);
  }

  inline function createElement(name : String)
    return doc.createElementNS(SVG, name);
}
