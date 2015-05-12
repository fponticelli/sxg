package sxg.core;

import thx.geom.d2.*;
import thx.geom.Matrix23;
using thx.Functions;
using thx.Strings;

class Geom {
  public static function linkedSize<T>(doc : Document<T>, el : T, width : Float, height : Float)
    return Size.linked(
      doc.getFloatAttribute.bind(el, "width"),
      doc.getFloatAttribute.bind(el, "height"),
      doc.setFloatAttribute.bind(el, "width", _),
      doc.setFloatAttribute.bind(el, "height", _),
      width,
      height
    );

  public static function linkedPosition<T>(doc : Document<T>, el : T, xname = "x", yname = "y", x : Float, y : Float)
    return Point.linked(
      doc.getFloatAttribute.bind(el, xname),
      doc.getFloatAttribute.bind(el, yname),
      doc.setFloatAttribute.bind(el, xname, _),
      doc.setFloatAttribute.bind(el, yname, _),
      x,
      y
    );

  public static function linkedRadius<T>(doc : Document<T>, el : T, radius : Float)
    return Radius.linked(
      doc.getFloatAttribute.bind(el, "r"),
      doc.setFloatAttribute.bind(el, "r", _),
      radius
    );

  static var matrix_pattern = ~/matrix\(\s*(-?(?:\d+|\d*\.\d+)(?:e-?\d+)?)\s+(-?(?:\d+|\d*\.\d+)(?:e-?\d+)?)\s+(-?(?:\d+|\d*\.\d+)(?:e-?\d+)?)\s+(-?(?:\d+|\d*\.\d+)(?:e-?\d+)?)\s+(-?(?:\d+|\d*\.\d+)(?:e-?\d+)?)\s+(-?(?:\d+|\d*\.\d+)(?:e-?\d+)?)\s*\)/;

  public static function linkedMatrix<T>(doc : Document<T>, el : T, src : Matrix23) {
    var cache = null,
        m = Matrix23.identity.clone();
    function getTransform() {
      var ms = doc.getAttribute(el, "transform");
      if(ms == cache) return m;
      if(ms == null || ms.trim() == "") {
        m = Matrix23.identity;
      } else if(matrix_pattern.match(ms)){
        var v = [for(i in 1...7) Std.parseFloat(matrix_pattern.matched(i))];
        m = Matrix23.create(v[0], v[1], v[2], v[3], v[4], v[5]);
      } else {
        throw 'invalid matrix format "$ms"';
      }
      cache = ms;
      return m;
    }
    var updateTransform = Functions.noop;
    var linked = Matrix23.linked(
      function() return getTransform().a,
      function(v) { m.a = v; updateTransform(); return v; },
      function() return getTransform().b,
      function(v) { m.b = v; updateTransform(); return v; },
      function() return getTransform().c,
      function(v) { m.c = v; updateTransform(); return v; },
      function() return getTransform().d,
      function(v) { m.d = v; updateTransform(); return v; },
      function() return getTransform().e,
      function(v) { m.e = v; updateTransform(); return v; },
      function() return getTransform().f,
      function(v) { m.f = v; updateTransform(); return v; }
    );

    src.copyTo(linked);

    updateTransform = function() {
      if(m.isIdentity())
        doc.removeAttribute(el, "transform");
      else {
        var s = m.toString();
        trace('transform="$s"');
        doc.setAttribute(el, "transform", s);
      }
    }

    updateTransform();

    return linked;
  }
}
