package sxg.core;

import sxg.Svg.*;
using thx.Nulls;
using thx.Floats;
using thx.Strings;
using thx.Iterators;
using thx.Arrays;
using thx.Maps;

class XmlDocument implements Document<Xml> {
  var xml : Xml;
  var styles : Map<Xml, Map<String, String>>;
  static var prefixes = [ SVG => "svg", XLINK => "xmlink", XMLNS => "xmlns" ];

  public function new(?xml : Xml) {
    this.xml = null == xml ? Xml.createDocument() : xml;
    this.styles = new Map();
  }

  public function createElementNS(ns : String, name : String) : Xml {
    var xml = Xml.createElement(name);
    xml.set("xmlns", ns);
    return cast xml;
  }

  inline function p(ns : String) {
    var pr = prefixes.get(ns);
    if(null == pr) throw 'no prefix found for $ns';
    return pr;
  }

  public function elementToString(el : Xml, ?pretty = false) : String {
    var node : Xml = cast el;
    return format(node, 0, { ns : null });
  }

  public function appendChild(parent : Xml, child : Xml)
    parent.addChild(child);

  public function insertChild(parent : Xml, child : Xml, position : Int)
    parent.insertChild(child, position);

  public function removeChild(parent : Xml, child : Xml)
    parent.removeChild(child);

  public function getAttribute(el : Xml, name : String)
    return el.get(name);

  public function setAttribute(el : Xml, name : String, value : String) {
    if(null == value)
      el.remove(name);
    else
      el.set(name, value);
    return value;
  }

  public function getFloatAttribute(el : Xml, name : String) : Null<Float> {
    var v = el.get(name);
    if(null == v)
      return null;
    else
      return Std.parseFloat(v);
  }

  public function setFloatAttribute(el : Xml, name : String, value : Null<Float>) : Null<Float> {
    if(null == value)
      el.remove(name);
    else
      el.set(name, '${value.roundTo(6)}');
    return value;
  }

  public function removeAttribute(el : Xml, name : String)
    el.remove(name);

  public function getStyle(el : Xml, name : String) : String {
    var map = styles.get(el);
    if(null == map) return null;
    return map.get(name);
  }

  public function setStyle(el : Xml, name : String, value : String) : String {
    var map = styles.get(el);
    if(null == map) {
      map = new Map();
      styles.set(el, map);
    }
    map.set(name, value);
    return value;
  }

  public function getFloatStyle(el : Xml, name : String) : Null<Float> {
    var s = getStyle(el, name);
    if(null == s)
      return null;
    return Std.parseFloat(s);
  }

  public function setFloatStyle(el : Xml, name : String, value : Null<Float>) : Null<Float> {
    setStyle(el, name, '${value.roundTo(6)}');
    return value;
  }

  public function removeStyle(el : Xml, name : String) {
    var map = styles.get(el);
    if(null == map) return;
    map.remove(name);
  }

  public function getTextContent(el : Xml) : String {
    for(child in el) {
      if(child.nodeType == Xml.CData)
        return child.nodeValue;
    }
    return null;
  }

  public function setTextContent(el : Xml, content : String) : String {
    var child;
    while(null != (child = el.firstChild()))
      el.removeChild(child);
    el.addChild(Xml.createCData(content));
    return content;
  }

  function format(node : Xml, ind : Int, def : { ns : String }) {
    var ws    = '  '.repeat(ind),
        ns    = node.get("xmlns"),
        attributes = formatAttributes(node, def),
        styles = formatStyles(styles.get(node)),
        prefix = ns == def.ns ? "" : prefixes.get(ns) + ':',
        open  = '$ws<$prefix${node.nodeName}$styles$attributes>',
        close = '</${node.nodeName}>',
        children  = node.elements(),
        schildren = children.hasNext() ? children.map(function(child) {
            return format(child, ind+1, def);
          }).join("\n") : null;

    return open + (schildren == null ? "" : '\n$schildren\n$ws') + close;
  }

  function formatStyles(map : Map<String, String>) : String {
    if(null == map)
      return "";
    var rules = map.tuples().pluck('${_.left}:${_.right}').join("; ");
    return ' style="$rules"';
  }

  function formatAttributes(node : Xml, def : { ns : String }) {
    return node
      .attributes()
      .filter(function(att) {
        if(att != "xmlns") return true;
        var value = node.get(att);
        if(null == value) return true;
        if(null == def.ns) {
          def.ns = value;
          return true;
        }
        return !prefixes.exists(def.ns);
      })
      .map(function(att) {
        var value = node.get(att)
              .replace('&', '&amp;')
              .replace('<', '&lt;')
              .replace('"', '&quot;');
        return ' $att="$value"';
      })
      .join('');
  }
}
