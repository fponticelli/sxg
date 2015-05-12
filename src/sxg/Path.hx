package sxg;

import sxg.core.Geom;
import thx.Functions;
import thx.geom.d2.*;
import thx.geom.d2.Path as P;
import thx.math.Const;

class Path<T : {}> extends Element<T> {
  @:isVar public var shape(get, set) : P;
  function new(doc : sxg.core.Document<T>, d : String) {
    super(doc, "path");
    updatePath(d);
  }

  public function updatePath(d : String)
    this.shape = P.fromSVGPath(d);

  function get_shape()
    return shape;

  function set_shape(path : P) {
    this.shape = path;
    doc.setAttribute(el, "d", shape.toSVGPath());
    return path;
  }

}
