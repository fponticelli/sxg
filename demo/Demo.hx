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
//    trace("\n" + dom.toString());

    js.Browser.document.body.appendChild(dom.el);
  }

  static function render(svg : Svg<Dynamic>) {
    var r = svg.rect(15, 20, 100, 40);
    svg.arc(100, 200, 0, 30, 40, 60);

    svg.arc(100, 200, 35, 45, 40, 60);

    svg.arc(100, 200, 50, 300, 40, 60);

    svg.circle(100, 200, 35);

//    svg.circle(140, 200, 3);
//    svg.circle(160, 200, 3);
//    var a = 30 / 180 * Math.PI;
//    svg.circle(100 + Math.cos(a) * 40, 200 + Math.sin(a) * 40, 3);
//    svg.circle(100 + Math.cos(a) * 60, 200 + Math.sin(a) * 60, 3);
  }
}
