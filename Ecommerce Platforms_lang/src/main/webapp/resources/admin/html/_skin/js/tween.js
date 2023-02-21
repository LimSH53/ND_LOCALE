(function ($) {
  function sub_nav() {
    var controller = new ScrollMagic.Controller();
    var tgt = $("section.sub_navigation");
    var tween1 = TweenLite.to(tgt, 1.5, { position: "fixed", top: 0 }, 0.5);
    var scene1 = new ScrollMagic.Scene({
      triggerElement: "tgt",
      triggerHook: "onEnter",
      offset: 500,
    })
      .setTween(tween1)
      .addTo(controller);
  }
  function initPageIndex() {
    var controller = new ScrollMagic.Controller();
    var tween1 = TweenMax.staggerTo(
      $("section.part .index_banner_wrap>ul>li"),
      0.3,
      { css: { autoAlpha: 1 }, ease: Power4.easeInOut },
      0.3
    );
    var scene1 = new ScrollMagic.Scene({
      triggerElement: "section.part",
      triggerHook: "onEnter",
      offset: 200,
    })
      .setTween(tween1)
      .addTo(controller);
  }
  function contribution() {
    var controller = new ScrollMagic.Controller();
    var tween1 = function () {
      var el = $("div.s_wrap figure");
      $.each(el, function (e) {
        var _ = $(this);
        var delay = 500;
        setTimeout(function () {
          TweenLite.fromTo(_, 1.5, { autoAlpha: 0 }, { autoAlpha: 1 });
        }, e * delay);
      });
    };
    var scene1 = new ScrollMagic.Scene({
      triggerElement: "div.s_wrap",
      triggerHook: "onEnter",
      offset: 200,
      reverse: false, // once animating
    })
      .setTween(tween1)
      .addTo(controller);
  }
  $.fn.rotationInfo = function () {
    var el = $(this),
      tr =
        el.css("-webkit-transform") ||
        el.css("-moz-transform") ||
        el.css("-ms-transform") ||
        el.css("-o-transform") ||
        "",
      info = { rad: 0, deg: 0 };
    if (tr == tr.match("matrix\\((.*)\\)")) {
      tr = tr[1].split(",");
      if (typeof tr[0] != "undefined" && typeof tr[1] != "undefined") {
        info.rad = Math.atan2(tr[1], tr[0]);
        info.deg = parseFloat(((info.rad * 180) / Math.PI).toFixed(1));
      }
    }
    return info;
  };
  $(document).ready(function () {
    initFade();
    contribution();
    //		sub_nav();
    //		initPageIndex();
  });
})(jQuery);
