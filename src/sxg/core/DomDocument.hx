package sxg.core;

class DomDocument implements CoreDocument {
  var doc : Xml;

  public function new(?document : js.html.Document) {
    this.doc = null == document ? untyped __js__("window.document") : document;

    //this.xml = xml == null ?
  }
}
