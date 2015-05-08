import sxg.*;
import sxg.core.*;

class Demo {
  static function main() {
    var w = 600,
        h = 400,
        xml = Svg.xml(w, h),
        dom = Svg.dom(w, h);

    render(xml);
    render(dom);

    trace("\n" + xml.toString());
    trace("\n" + dom.toString());

    js.Browser.document.body.appendChild(dom.el);
  }

  static function render(svg : Svg<Dynamic>) {
    var r = svg.rect();
  }
}
