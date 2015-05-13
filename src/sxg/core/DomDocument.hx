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

  public function getAttribute(el : El, name : String)
    return el.getAttribute(name);

  public function setAttribute(el : El, name : String, value : String) : String {
    if(null == value)
      el.removeAttribute(name);
    else
      el.setAttribute(name, value);
    return value;
  }

  public function getFloatAttribute(el : El, name : String) : Null<Float> {
    var v = el.getAttribute(name);
    if(null == v)
      return null;
    else
      return Std.parseFloat(v);
  }

  public function setFloatAttribute(el : El, name : String, value : Null<Float>) : Null<Float> {
    if(null == value)
      el.removeAttribute(name);
    else
      el.setAttribute(name, ""+value);
    return value;
  }

  public function getStyle(el : El, name : String) : String
    return untyped __js__("doc.getComputedStyle")(el)[ruleName];

  public function setStyle(el : El, name : String, value : String) : String {
    Reflect.setField(el.style, name, value);
    return value;
  }

  public function getFloatStyle(el : El, name : String) : Null<Float> {
    var s = getStyle(el, name);
    if(null == s)
      return null;
    return Std.parseFloat(s);
  }

  public function setFloatStyle(el : El, name : String, value : Null<Float>) : Null<Float> {
    setStyle(el, name, '$value');
    return value;
  }

  public function removeStyle(el : El, name : String) {
    Reflect.deleteField(el.style, name);
  }
}
