$(function () {
  // menu button
  var num = 0;
  var flag = true;
  $(".m-menu-btn")
    .unbind("click")
    .bind("click", function () {
      num++;
      if (flag) {
        $("#header .m-gnb-bg").fadeIn();
        $("#header .gnb").animate({ right: 0, opacity: 1 }, 500);
        $("#header .m-lang").animate({ right: 0, opacity: 1 }, 500);
        //			$("body").css("overflow","hidden");
        $("body").addClass("gnb-open");
        flag = false;
      } else {
        $("#header .m-gnb-bg").fadeOut();
        $("#header .gnb").animate({ right: -100 + "%", opacity: 1 }, 500);
        $("#header .m-lang").animate({ right: -100 + "%", opacity: 0 }, 500);
        flag = true;
        //			$("body").css("overflow","visible");
        $("body").removeClass("gnb-open");
      }
      $(this).toggleClass("on");
    });

  // gnb current menu
  var _pathname = location.pathname;
  _pathname = _pathname.split("/");
  if ($("html").attr("lang") == "ko") {
    _pathname = _pathname[1];
  } else {
    _pathname = _pathname[2];
  }
  $("#header .gnb > ul > li > a").each(function () {
    var _href = $(this).attr("href");
    if (_href.indexOf(_pathname) != -1) $(this).addClass("current");
  });

  // mobile 2depth
  function gnbClickOn() {
    $(".gnb>ul>li>a")
      .unbind("click")
      .bind("click", function (e) {
        var tag = $(this).parent().has("ul").text();
        if (tag.length != 0) {
          e.preventDefault();
          $(".gnb>ul>li>a")
            .not(this)
            .parent()
            .removeClass("on")
            .children("ul")
            .slideUp(200);
          $(this)
            .parent()
            .addClass("on")
            .children("ul")
            .slideToggle(200, function () {
              if ($(this).css("display") == "none") {
                $(this).parent().removeClass("on");
              }
            });
        }
      });
  }
  function gnbClickOff() {
    $(".gnb>ul>li>a")
      .unbind("click")
      .bind("click", function (e) {
        e.stopPropagation();
      });
    $("#header .gnb > ul > li").on("mouseenter", function () {
      $("#header").addClass("depth-bg-open");
    });
    $("#header .gnb > ul > li").on("mouseleave", function () {
      $("#header").removeClass("depth-bg-open");
    });
  }

  $(document).ready(function () {
    var w = $(window).width() + 18;
    if (w <= 1200) {
      gnbClickOn();
    } else {
      gnbClickOff();
    }

    $("#searchBtn").on("click", function (e) {
      e.preventDefault();
      $(".search_box").toggleClass("block");
    });
  });
  $(window).on("load resize", function () {
    var w = $(window).width() + 18;
    if (w <= 1200) {
      gnbClickOn();
    } else {
      gnbClickOff();
    }
  });

  // var sta = 50;
  $(window).scroll(function () {
    var w = $(window).width() + 18;
    var sta = $(".sta").outerHeight();
    if ($(window).scrollTop() >= sta) {
      $("#header").addClass("fixed");
    } else {
      $("#header").removeClass("fixed");
    }
  });
  $(window).on("load resize", function () {
    var w = $(window).width() + 18;
    var sta = $(".sta").outerHeight();
    if ($(window).scrollTop() >= sta) {
      $("#header").addClass("fixed");
    } else {
      $("#header").removeClass("fixed");
    }
  });

  /* sitemap */
  var headerSitemap = $("#headerSitemap");
  var gnbList = $("#header .gnb > ul");
  gnbList.clone().appendTo(headerSitemap);

  var sitemapBtn = $(".pc_sitemap_btn");
  sitemapBtn.on("click", function () {
    $(this).toggleClass("on");
    $("#header").toggleClass("depth-bg-open");
    // headerSitemap.toggleClass('on');
  });

  /* footer family site */
  $(function () {
    $(".familySite h3 a").on("click", function (e) {
      e.preventDefault();
      if ($(".familySite").hasClass("on")) {
        $(".familySite").removeClass("on");
        $(".footSelect > ul").slideUp();
      } else {
        $(".familySite").addClass("on");
        $(".footSelect > ul").slideDown();
      }
    });
    $(document).click(function (event) {
      if (!$(event.target).closest(".familySite").length) {
        $(".familySite").removeClass("on");
        $(".footSelect > ul").slideUp();
      }
    });
  });
});
