package sxg;

import sxg.core.Geom;
import thx.Functions;
import thx.geom.d2.*;
import thx.geom.d2.Arc as A;
import thx.math.Const;

class Arc<T> extends Element<T> {
  public var shape(default, null) : A;
  function new(doc : sxg.core.Document<T>, cx : Float, cy : Float, startAngle : Float, endAngle : Float, innerRadius : Float, outerRadius : Float) {
    super(doc, "path");

    var trigger = Functions.noop;

    this.shape = new A(
      Point.linked(
        function() return cx,
        function() return cy,
        function(v) {
          cx = v;
          trigger();
          return v;
        },
        function(v) {
          cy = v;
          trigger();
          return v;
        }
      ),
      Angle.linked(
        function() return startAngle * Const.TO_RADIAN,
        function(v) {
          startAngle = v * Const.TO_DEGREE;
          trigger();
          return v;
        }
      ),
      Angle.linked(
        function() return endAngle * Const.TO_RADIAN,
        function(v) {
          endAngle = v * Const.TO_DEGREE;
          trigger();
          return v;
        }
      ),
      Radius.linked(
        function() return innerRadius,
        function(v) {
          innerRadius = v;
          trigger();
          return v;
        }
      ),
      Radius.linked(
        function() return outerRadius,
        function(v) {
          outerRadius = v;
          trigger();
          return v;
        }
      )
    );

    trigger = function() doc.setAttribute(el, "d", shape.path.toSVGPath());

    trigger();
  }
}
