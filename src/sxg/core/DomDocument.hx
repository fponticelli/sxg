package sxg.core;

import js.html.Document as Doc;

class DomDocument implements Document {
  var doc : Doc;

  public function new(?document : Doc) {
    this.doc = null == document ? untyped __js__("window.document") : document;
  }

  public function createElementNS(ns : String, name : String) : Element {
    return doc.createElementNS(ns, name);
  }

  public function elementToString(el : Element, ?pretty = false) : String {
    var node : js.html.Element = cast el;
    return node.outerHTML;
  }
}
