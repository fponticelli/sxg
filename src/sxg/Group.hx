package sxg;

import sxg.core.Document;

class Group<T> extends Element<T> {
  public function new(doc : Document<T>) {
    super(doc, "g");
  }
}
