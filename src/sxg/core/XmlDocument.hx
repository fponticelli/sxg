package sxg.core;

import sxg.Svg.*;
using thx.Nulls;
using thx.Strings;
using thx.Iterators;

class XmlDocument implements Document<Xml> {
  var xml : Xml;
  static var prefixes = [ SVG => "svg", XLINK => "xmlink", XMLNS => "xmlns" ];

  public function new(?xml : Xml) {
    this.xml = null == xml ? Xml.createDocument() : xml;
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
      el.set(name, ""+value);
    return value;
  }

  public function removeAttribute(el : Xml, name : String)
    el.remove(name);

  static function format(node : Xml, ind : Int, def : { ns : String }) {
    var ws    = '  '.repeat(ind),
        ns    = node.get("xmlns"),
        attributes = formatAttributes(node, def),
        prefix = ns == def.ns ? "" : prefixes.get(ns) + ':',
        open  = '$ws<$prefix${node.nodeName}$attributes>',
        close = '</${node.nodeName}>',
        children  = node.elements(),
        schildren = children.hasNext() ? children.map(function(child) {
            return format(child, ind+1, def);
          }).join("\n") : null;

    return open + (schildren == null ? "" : '\n$schildren\n$ws') + close;
  }

  static function formatAttributes(node : Xml, def : { ns : String }) {
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
