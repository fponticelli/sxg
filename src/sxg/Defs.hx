package sxg;

import sxg.core.Document;

class Defs<T : {}> extends Element<T> {
  static var _id : Int = 0;

  public function new(doc : Document<T>) {
    super(doc, "defs");
  }

  public function pattern(?id : String, width : Float, height : Float, ?x : Float = 0, ?y : Float = 0) : Pattern<T> {
    if(null == id) id = 'Def_${++_id}';
    var p = new Pattern(doc, id, x, y, width, height);
    add(cast p); // TODO cast should not be required
    return p;
  }
}
