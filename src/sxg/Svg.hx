package sxg;

class Svg {
  public static function xml()
    return new Svg(Document.xml());

  #if js
  public static function dom(?document : js.html.Document)
    return new Svg(Document.dom(document));
  #end

  var doc : Document;
  function new(doc : Document) {
    this.doc = doc;
  }

  public function toString() {
    return "svg???";
  }
}
