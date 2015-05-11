package sxg;

import sxg.core.*;
import thx.geom.d2.Size;

class Svg<T : {}> extends Element<T> {
  public inline static var SVG   = 'http://www.w3.org/2000/svg';
  public inline static var XMLNS = 'http://www.w3.org/2000/xmlns/';
  public inline static var XLINK = 'http://www.w3.org/1999/xlink';

  public static function xml(width : Float, height : Float) : Svg<Xml>
    return new Svg(new XmlDocument(), width, height);

  #if js
  public static function dom(width : Float, height : Float, ?document : js.html.Document) : Svg<js.html.Element>
    return new Svg(new DomDocument(document), width, height);
  #end

  public var size(default, null) : Size;

  function new(doc : Document<T>, width : Float, height : Float) {
    super(doc, "svg");
    this.size = Geom.linkedSize(doc, el, width, height);
  }
}
