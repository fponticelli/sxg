import sxg.*;
import sxg.core.*;
import thx.color.HSLA;

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

    var a = svg.arc(100, 200, 0, 30, 40, 60);
    svg.arc(100, 200, 35, 45, 40, 60);
    svg.arc(100, 200, 50, 300, 40, 60);

    a.shape.center.x = 150;

    svg.circle(100, 200, 50)
      .style.fill = Color(HSLA.create(90, 0.5, 0.7, 0.95));

    var arc = svg.arc(100, 200, -100, 200, 65, 70);
    arc.style.fill = Color(HSLA.create(270, 0.5, 0.7, 0.5));
    arc.style.stroke = Color(HSLA.create(90, 0.5, 0.7, 1));
  }
}
