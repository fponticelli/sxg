package sxg.core;

import js.html.Document as Doc;
import js.html.Element as El;

class DomDocument implements Document<El> {
  var doc : Doc;

  public function new(?document : Doc) {
    this.doc = null == document ? untyped __js__("window.document") : document;
  }

  public function createElementNS(ns : String, name : String) : El
    return doc.createElementNS(ns, name);

  public function elementToString(el : El, ?pretty = false) : String
    return el.outerHTML;

  public function appendChild(parent : El, child : El)
    parent.appendChild(child);

  public function removeChild(parent : El, child : El)
    parent.removeChild(child);
}
