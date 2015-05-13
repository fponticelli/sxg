package sxg;

import sxg.core.Geom;
import sxg.core.Document;
import thx.geom.d2.*;

class Text<T : {}> extends Element<T> {
  public var content(get, set) : String;
  public var position(default, null) : Point;
  public var textStyle(default, null) : TextStyle<T>;
  public var anchor(get, set) : TextAnchor;

  function new(doc : Document<T>, x : Float, y : Float, content : String) {
    super(doc, "text");
    this.textStyle = new TextStyle(doc, el);
    this.content = content;
    Geom.linkedPosition(doc, el, x, y);
  }

  function get_anchor()
    return TextAnchor.parse(doc.getAttribute(el, "text-anchor"));

  function set_anchor(v : TextAnchor) {
    doc.setAttribute(el, "text-anchor", v);
    return v;
  }

  function get_content()
    return doc.getTextContent(el);

  function set_content(t : String)
    return doc.setTextContent(el, t);
}

@:enum
abstract TextAnchor(String) to String {
  var Start = "start";
  var Middle = "middle";
  var End = "end";

  public static function parse(s : String) : TextAnchor {
    if(null == s)
      return null;
    return switch s.toLowerCase() {
      case "start": Start;
      case "end": End;
      case "middle": Middle;
      case _: throw 'Invalid anchor value "$s"';
    };
  }
}
