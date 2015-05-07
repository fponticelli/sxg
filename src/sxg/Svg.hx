package sxg;

import sxg.core.*;

class Svg {
  public inline static var SVG   = 'http://www.w3.org/2000/svg';
  public inline static var XMLNS = 'http://www.w3.org/2000/xmlns/';
  public inline static var XLINK = 'http://www.w3.org/1999/xlink';

  public static function xml()
    return new Svg(new XmlDocument());

  #if js
  public static function dom(?document : js.html.Document)
    return new Svg(new DomDocument(document));
  #end

  var doc : Document;
  var root : Element;
  function new(doc : Document) {
    this.doc = doc;
    //this.root = doc.cr
  }

  public function toString() {
    return "svg???";
  }
}
