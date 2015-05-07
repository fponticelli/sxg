package sxg.core;

import sxg.Document.*;

class XmlDocument implements CoreDocument {
  var xml : Xml;
  var prefixes : Map<String, String>;

  public function new(?xml : Xml, ?prefixes : Map<String, String>) {
    this.xml = null == xml ? Xml.createDocument() : xml;
    if(null == prefixes) {
      this.prefixes = [ SVG => "svg", XLINK => "xmlink", XMLNS => "xmlns" ];
    } else {
      this.prefixes = prefixes;
    }
  }

  public function createElementNS(ns : String, name : String) : Element {
    return Xml.createElement(p(ns, name));
  }

  inline function p(ns : String, value : String) {
    var pr = prefixes.get(ns);
    if(null == pr) throw 'no prefix found for $ns';
    return '$pr:$value';
  }
}
