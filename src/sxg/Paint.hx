package sxg;

import sxg.core.Document;
import thx.color.RGBXA;
import thx.color.Color as C;

enum Paint {
  None;
  Color(color : RGBXA);
  Inherit;
}

class Paints {
  public static function getPaint<T>(doc : Document<T>, el : T, attribute : String, useAlpha = true) {
    var alpha = '$attribute-opacity';
    var s = doc.getStyle(el, attribute);
    if(null == s)
      return Inherit;
    else if(s == "none")
      return None;
    else {
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
        doc.setStyle(el, attribute, color.toRGBX().toCSS3());
        if(useAlpha) {
          if(color.alphaf < 1)
            doc.setFloatStyle(el, alpha, color.alphaf);
          else
            doc.removeStyle(el, alpha);
        }
    }
  }
}
