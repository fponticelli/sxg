package sxg;

import sxg.core.Document;
import thx.color.Rgbxa;
import thx.color.Color as C;

enum Paint {
  None;
  Color(color : Rgbxa);
  Url(url : String);
  Inherit;
}

class Paints {
  static var URL_PATTERN = ~/^\s*url\(([^)]+)\)\s$/;
  public static function getPaint<T>(doc : Document<T>, el : T, attribute : String, useAlpha = true) {
    var alpha = '$attribute-opacity';
    var s = doc.getStyle(el, attribute);
    if(null == s)
      return Inherit;
    else if(s == "none")
      return None;
    else if(URL_PATTERN.match(s)) {
      return Url(URL_PATTERN.matched(1));
    } else {
      var c = C.parse(s);
      if(useAlpha) {
        var a = doc.getFloatStyle(el, alpha);
        if(null != a)
          c = c.withAlpha(a);
      }
      return Color(c);
    }
  }

  public static function apply<T>(paint : Paint, doc : Document<T>, el : T, attribute : String, useAlpha = true) {
    var alpha = '$attribute-opacity';
    switch paint {
      case None:
        doc.setStyle(el, attribute, "none");
        if(useAlpha)
          doc.removeStyle(el, alpha);
      case Inherit:
        doc.removeStyle(el, attribute);
        doc.removeStyle(el, alpha);
      case Color(color):
        doc.setStyle(el, attribute, color.toRgbx().toCss3());
        if(useAlpha) {
          if(color.alphaf < 1)
            doc.setFloatStyle(el, alpha, color.alphaf);
          else
            doc.removeStyle(el, alpha);
        }
      case Url(url):
        doc.setStyle(el, attribute, 'url($url)');
    }
  }
}
