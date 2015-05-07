package sxg;

import sxg.core.*;

class Document {
  public static function createXml() {
    return new Document(new XmlDocument());
  }

#if js
  public static function createDom(?document : js.html.Document) {
    return new Document(new DomDocument(document));
  }
#end

  var doc : CoreDocument;
  function new(doc : CoreDocument) {
    this.doc = doc;
  }
}
