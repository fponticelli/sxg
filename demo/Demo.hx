import sxg.*;
import sxg.core.*;

class Demo {
  static function main() {
    var xml = Svg.xml(),
        dom = Svg.dom();

    render(xml);
    render(dom);

    trace(xml.toString());
    trace(dom.toString());
  }

  static function render(svg : Svg<Dynamic>) {
    var r = svg.rect();
  }
}
