package sxg.core;

import js.html.Document;

class DomDocument implements CoreDocument {
  var doc : Document;

  public function new(?document : Document) {
    this.doc = null == document ? untyped __js__("window.document") : document;
  }

  public function createElementNS(ns : String, name : String) : Element {
    return doc.createElementNS(ns, name);
  }
}
