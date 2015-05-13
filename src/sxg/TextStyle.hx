package sxg;

import sxg.core.Document;
import sxg.Element;
//using sxg.Paint;

class TextStyle<T> {
  var el : T;
  var doc : Document<T>;
  public function new(doc : Document<T>, el : T) {
    this.doc = doc;
    this.el = el;
  }

  public var anchor(get, set) : TextAnchor;

  function get_anchor()
    return TextAnchor.parse(doc.getAttribute(el, "text-anchor"));

  function set_anchor(v : TextAnchor) {
    doc.setAttribute(el, "text-anchor", v);
    return v;
  }
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
