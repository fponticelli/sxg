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

  public function removeAttribute(el : El, name : String)
    el.removeAttribute(name);

  public function setAttribute(el : El, name : String, value : String) : String {
    el.setAttribute(name, value);
    return value;
  }

  public function setFloatAttribute(el : El, name : String, value : Float) : Float {
    el.setAttribute(name, ""+value);
    return value;
  }

  public function getAttribute(el : El, name : String)
    return el.getAttribute(name);

  public function getFloatAttribute(el : El, name : String)
    return Std.parseFloat(el.getAttribute(name));
}
