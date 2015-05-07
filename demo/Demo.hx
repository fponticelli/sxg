import sxg.*;
import sxg.core.*;

class Demo {
  static function main() {
    var xml = Svg.xml(),
        dom = Svg.dom();

    trace(xml.toString());
    trace(dom.toString());
  }
}
