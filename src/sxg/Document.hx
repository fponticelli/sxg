package sxg;

import sxg.core.*;

class Document {
  public inline static var SVG   = 'http://www.w3.org/2000/svg';
  public inline static var XMLNS = 'http://www.w3.org/2000/xmlns/';
  public inline static var XLINK = 'http://www.w3.org/1999/xlink';

  public static function xml()
    return new Document(new XmlDocument());

#if js
  public static function dom(?document : js.html.Document)
    return new Document(new DomDocument(document));
#end

  var doc : CoreDocument;
  function new(doc : CoreDocument) {
    this.doc = doc;
  }
}
