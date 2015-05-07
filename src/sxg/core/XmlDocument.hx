package sxg.core;

class XmlDocument implements CoreDocument {
  var xml : Xml;

  public function new(?xml : Xml) {
    this.xml = null == xml ? Xml.createDocument() : xml;

    //this.xml = xml == null ?
  }
}
