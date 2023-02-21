function checkVisible(element, check = "above") {
  const ch = $(".num-item");
  if (ch.length) {
    const viewportHeight = $(window).height(); // Viewport Height
    const scrolltop = $(window).scrollTop(); // Scroll Top
    const y = $(element).offset().top;
    const elementHeight = $(element).height();

    // 반드시 요소가 화면에 보여야 할경우
    if (check == "visible")
      return y < viewportHeight + scrolltop && y > scrolltop - elementHeight;

    // 화면에 안보여도 요소가 위에만 있으면 (페이지를 로드할때 스크롤이 밑으로 내려가 요소를 지나쳐 버릴경우)
    if (check == "above") return y < viewportHeight + scrolltop;
  }
}
let isVisible = false;

//이벤트에 등록할 함수
const func = function () {
  if (!isVisible && checkVisible("#num-item")) {
    increaseMathCount();

    isVisible = true;
  }

  // 만일 리소스가 로드가 되면 더이상 이벤트 스크립트가 있을 필요가 없으니 삭제
  isVisible && window.removeEventListener("scroll", func);
};

//스크롤 이벤트 등록
window.addEventListener("scroll", func);

function increaseMathCount() {
  $(".nums").each(function () {
    const $this = $(this),
      countTo = $this.attr("data-count");

    $({
      countNum: $this.text(),
    }).animate(
      {
        countNum: countTo,
      },
      {
        duration: 2000,
        easing: "linear",
        step: function () {
          $this.text(Math.floor(this.countNum));
        },
        complete: function () {
          $this.text(
            this.countNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
          );
          //3자리 마다 콤마 표시 적용
        },
      }
    );
  });
  $(".yearNums").each(function () {
    const $this = $(this),
      countTo = $this.attr("data-count");

    $({
      countNum: $this.text(),
    }).animate(
      {
        countNum: countTo,
      },
      {
        duration: 2000,
        easing: "linear",
        step: function () {
          $this.text(Math.floor(this.countNum));
        },
        complete: function () {
          $this.text(
            this.countNum.toString().replace(/\B(?=(\d{3})+(?!\d))/g, "")
          );
          //3자리 마다 콤마 표시 적용
        },
      }
    );
  });
}
function checkMobile() {
  var varUA = navigator.userAgent.toLowerCase(); //userAgent 媛� �산린
  if (varUA.indexOf("android") > -1) {
    $("html").removeAttr("data-device").attr("data-device", "android");
  } else if (
    varUA.indexOf("iphone") > -1 ||
    varUA.indexOf("ipad") > -1 ||
    varUA.indexOf("ipod") > -1
  ) {
    $("html").removeAttr("data-device").attr("data-device", "ios");
  } else {
    //�꾩씠��, �덈뱶濡쒖씠�� ��
    //$('html').addClass('other');
  }
}

var mobile = /iphone|ipad|ipod|android/i.test(
  navigator.userAgent.toLowerCase()
);

if (mobile) {
  //紐⑤컮�� 泥섎━
} else {
  //鍮� 紐⑤컮�� 泥섎━
}

var touchEvent = {
  opt: {
    wrap: $("html"),
    wrapper: $("body"),
    container: $("#container"),
    windowH: $(window).height(),
    winSch: "",
  },
  stop: function () {
    winSch = $(window).scrollTop();

    touchEvent.opt.container.on("scroll touchmove mousewheel", function (e) {
      e.preventDefault();
      e.stopPropagation();
      return false;
    });

    $("body").addClass("overflow");

    // touchEvent.opt.wrap.css({
    //     'width' : '100%',
    //     'height' : '100vh',
    //     'position' : 'fixed',
    //     'top' : -winSch
    // });
  },
  start: function () {
    touchEvent.opt.wrap.removeAttr("style");
    $(window).scrollTop(winSch);
    $("body").removeClass("overflow");
    touchEvent.opt.container.off("scroll touchmove mousewheel");
  },
};

var modalPop = {
  opt: {
    wrapper: $("body"),
  },
  open: function (target, autoClose, btns) {
    var $targetFocus = $(target).find(
        "button, input:not([type='hidden']), select, iframe, textarea, [href], [tabindex]:not([tabindex='-1'])"
      ),
      $targetFocusFirst = $targetFocus && $targetFocus.first(),
      $targetFocusLast = $targetFocus && $targetFocus.last();

    modalPop.opt.wrapper.addClass("overflow");
    $(target).append('<div class="dim"></div>');
    $(target).addClass("active");

    if (autoClose == true) {
      $(target)
        .find(".dim")
        .on("click", function (e) {
          modalPop.targetClose(target);
        });
    }
    //touchEvent.stop();
    preventScroll(".layer_wrapper .layer_outer");
    //$(btns).addClass('is-clicked');

    $targetFocusLast.on("keydown", function (e) {
      if (!e.shiftKey && (e.keyCode || e.which) === 9) {
        e.preventDefault();
        $targetFocusFirst.attr("tabindex", "0").focus();
      }
    });

    $targetFocus.length
      ? $targetFocusFirst.focus().on("keydown", function (e) {
          if (e.shiftKey && (e.keyCode || e.which) === 9) {
            e.preventDefault();
            $targetFocusLast.focus();
          }
        })
      : $(target)
          .attr("tabindex", "0")
          .focus()
          .on("keydown", function (e) {
            if ((e.keyCode || e.which) === 9) e.preventDefault();
          });
    $(target).attr("tabindex", "0").focus();
    $(target).children().scrollTop(0);
  },
  close: function (target) {
    if ($(target).parents("#pop_customer")) {
      contactPopReset(target);
    }
    $(target)
      .parents(".layer_wrapper")
      .removeClass("active")
      .find(".dim")
      .remove();
    modalPop.opt.wrapper.removeClass("overflow");
    //$('.is-clicked').removeClass('is-clicked').focus();
    modalPop.targetFocus();
    $(target).find(".layer_inner").removeAttr("tabindex");
    // touchEvent.start();
    allowScroll(".layer_wrapper .layer_outer");
  },
  targetClose: function (target) {
    $(target).removeClass("active").find(".dim").remove();
    modalPop.opt.wrapper.removeClass("overflow");
    //$('.is-clicked').removeClass('is-clicked').focus();
    modalPop.targetFocus();
    $(target).find(".layer_inner").removeAttr("tabindex");
    //touchEvent.start();
    allowScroll(".layer_wrapper .layer_outer");
  },
  targetFocus: function () {
    if ($(".is-clicked").length) {
      $(".is-clicked").removeClass("is-clicked").focus();
    }
  },
};

/* �곸긽愿��� �앹뾽 �닿린 */
function moviePopOpen(target, btn) {
  var $url = $(btn).attr("data-url"),
    $title = $(btn).attr("data-title");

  $(target).find("iframe").attr("src", "");

  setTimeout(function () {
    $(target).find("iframe").attr({ src: $url, title: $title });
  }, 100);

  modalPop.open(target);
}

/* �곸긽愿��� �앹뾽 �リ린 */
function moviePopClose(target) {
  $(target).prev().find("iframe").attr({ src: "", title: "" });
  modalPop.close(target);
}

/* �쒕퉬�ㅼ냼媛� �ㅽ겕濡ㅻ컮 */
function makeScroll() {
  var $target = $(".scrollbar-area_inner");
  if ($target.length) {
    if ($(window).width() < 769) {
      $target.scrollbar({
        autoScrollSize: false,
        scrollx: $(".external-scroll_x"),
      });
    } else {
      $target.scrollbar("destroy");
    }
  }
}

/* �쒖슜�щ� �숈옉 */
function usePanelInit(target) {
  var $target = $(target).find("li > a"),
    $panel = $target.parent().find(".use_case-detail, .culture_card_detail");

  if ($panel.length == 0) {
    return false;
  }

  function init() {
    if (mobile) {
      $target.on("click", function (e) {
        var $this = $(this);
        e.preventDefault();
        open($this);
      });
    } else {
      $target.on("mouseover", function (e) {
        var $this = $(this);
        e.preventDefault();
        open($this);
      });

      $target.parent().on("mouseleave", function (e) {
        close();
      });
    }
  }

  init();

  function open(target) {
    // console.log(target);
    $(target).parent().siblings().removeClass("active");
    $(target)
      .parent()
      .siblings()
      .find(".use_case-detail, .culture_card_detail")
      .fadeOut(300);
    $(target).parent().addClass("active");
    $(target)
      .parent()
      .find(".use_case-detail, .culture_card_detail")
      .fadeIn(300);
    $target.parent().find(".icon.card_ui-close").on("click", close);
  }

  function close() {
    $panel.fadeOut(300);
    $target.parent().removeClass("active");
  }

  // $(window).on('resize' , init)
  // $target.on('mouseleave focusout' , close)
}

/* �レ옄 移댁슫�� */
function countInit() {
  if (!$("[data-num]").length) {
    return false;
  }
  $("[data-num]").each(function () {
    var $count = $(this),
      $countTo = $count.attr("data-num"),
      $time = $(this).hasClass("small-num") ? 200 : 1000;

    //console.log()

    function countStart() {
      $({ countNum: $count.text() })
        .stop()
        .animate(
          {
            countNum: $countTo,
          },
          {
            duration: $time,
            easing: "linear",
            step: function () {
              if ($count.is(".is-date")) {
                $count.text(Math.floor(this.countNum));
              } else {
                $count.text(commaAdd(Math.floor(this.countNum)));
              }
            },
            complete: function () {
              if ($count.is(".is-date")) {
                $count.text(Math.floor(this.countNum));
              } else {
                $count.text(commaAdd(this.countNum));
              }
            },
          }
        );

      function commaAdd(val) {
        while (/(\d+)(\d{3})/.test(val.toString())) {
          val = val.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,");
        }
        return val;
      }
    }

    numCount();

    $(window).on("scroll.number", numCount);

    function numCount() {
      if (
        $(window).scrollTop() + $(window).height() / 2 >
        $("[data-num]").parents(".layout_section_outer").offset().top
      ) {
        countStart();
        $(window).off("scroll.number");
      }
    }
  });
}

function customScrollY(target) {
  var $target = $(target);

  $(window).on("resize load", function () {
    var $winW = $(window).width();

    if ($target.is(".footer_layer_scroll")) {
      if ($winW < 769) {
        deleteSCroll();
      } else {
        makeScroll();
      }
    } else {
      if ($winW < 1024) {
        // deleteSCroll()
      } else {
        makeScroll();
      }
    }

    // function makeScroll() {
    //   $target.each(function () {
    //     $(this).scrollbar();
    //   });
    // }
    // function deleteSCroll(){
    //     $target.each(function(){
    //         $(this).scrollbar('destroy');
    //     });
    // }
  });
}

var file; //硫붿씪諛쒖넚 泥⑤��뚯씪 蹂���
/* �뚯씪泥⑤� */
function customFileUpload() {
  var $obj = $(".common-file-upload");

  $obj.each(function () {
    ($inputTxt = $(this).find(".file_viewer-box .file_viewer-txt")),
      ($inputFile = $(this).find('input[type="file"]')),
      ($button = $(this).find(".common-btn")),
      ($del = $(this).find(".val-del"));

    $button.off().on("click", function (e) {
      e.preventDefault();
      $(this).prev().click();
    });

    $inputFile.on("change", function () {
      if (window.FileReader) {
        if ($(this)[0].files[0] == null) return false;
        var filename = $(this)[0].files[0].name;
        var filesize = $(this)[0].files[0].size;
        var fileext = $(this).val().split(".").pop().toLowerCase();

        if (
          $.inArray(fileext, [
            "zip",
            "pdf",
            "hwp",
            "ppt",
            "pptx",
            "doc",
            "docx",
            "xls",
            "xlsx",
            "jpg",
            "jpeg",
            "png",
            "gif",
          ]) == -1
        ) {
          alert(
            "�뚯씪 �뺤떇�� zip, pdf, hwp, ppt, pptx, doc, docx, xls, xlsx, jpg, jpeg, png, gif 留� 媛��ν빀�덈떎."
          );
          $(this).val("");
          return false;
        } else if (filesize > 10 * 1024 * 1024) {
          alert("泥⑤��뚯씪�� 理쒕� 10MB源뚯� �깅줉 媛��ν빀�덈떎.");
          $(this).val("");
          return false;
        }
      }

      $(this)
        .parents(".common-file-upload")
        .find(".file_viewer-box")
        .addClass("active");
      $(this)
        .parents(".common-file-upload")
        .find(".file_viewer-txt")
        .text(filename);
      file = $(this)[0].files[0];
    });

    $del.off().on("click", function () {
      $(this).parents(".common-file-upload").find('input[type="file"]').val("");
      $(this)
        .parents(".common-file-upload")
        .find(".file_viewer-txt")
        .text("泥⑤��뚯씪�� �놁뒿�덈떎.");
      $(this)
        .parents(".common-file-upload")
        .find(".file_viewer-box")
        .removeClass("active");
    });
  });
}

function faqInit() {
  var $obj = $(".faq_area"),
    $btn = $obj.find(".btn-panel");

  $btn.on("click", function () {
    $(this).toggleClass("active");
    $(this).next().slideToggle(150);
  });
}
function moveSessionScroll(cls, sessionSt) {
  if ($("#wrap").hasClass(cls) && sessionSt) {
    var $thisTargetTop = $(".common-swiper_tab li.active a").offset().top;
    $("#header").css("transition", "none");
    $("html, body")
      .stop()
      .animate(
        {
          scrollTop: +sessionSt,
        },
        {
          duration: 0,
          complete: function () {
            if (+sessionSt != $thisTargetTop)
              $("html, body")
                .stop()
                .animate({ scrollTop: $thisTargetTop }, { duration: 500 });
          },
        }
      );
  }
}

function tabMove() {
  var $tab = $(".common-swiper_tab a"),
    $panel = $('[data-js="anchor-target"]');

  $tab.each(function () {
    $(this).on("click", function (e) {
      if (!$(this).hasClass("is-link")) {
        e.preventDefault();
        $(this).parent().siblings().removeClass("active");
        $(this).parent().addClass("active");
      } else {
        sessionStorage.setItem("cur-st", $(window).scrollTop());
        //if($('#wrap').hasClass('equitable_edu'))sessionStorage.setItem('esg_edu-st',$(window).scrollTop());
        //if($('#wrap').hasClass('history'))sessionStorage.setItem('history-st',$(window).scrollTop());
      }

      if (!$panel.length == 0) {
        move($(this).parent().index());
      }
    });
  });
  //moveSessionScroll('equitable_edu', sessionStorage.getItem('esg_edu-st'));
  //moveSessionScroll('history', sessionStorage.getItem('history-st'));
  var sessionSt = sessionStorage.getItem("cur-st");
  var scrollYN = $(".scrollYN").val();
  if (
    sessionSt &&
    $(".common-swiper_tab li.active a").length > 0 &&
    scrollYN != "N"
  ) {
    var $thisTargetTop = $(".common-swiper_tab li.active a").offset().top;
    $("#header").css("transition", "none");
    $("html, body")
      .stop()
      .animate(
        {
          scrollTop: +sessionSt,
        },
        {
          duration: 0,
          complete: function () {
            if (+sessionSt != $thisTargetTop)
              $("html, body")
                .stop()
                .animate({ scrollTop: $thisTargetTop }, { duration: 500 });
          },
        }
      );
  }

  function scrollMove() {
    if ($panel.length) {
      $(window).on("scroll", function () {
        $tab.each(function () {
          var $panelIdx = $panel.eq($(this).parent().index()),
            $docT = $(document).scrollTop();
          if ($docT > $panelIdx.offset().top) {
            $tab.parent().siblings().removeClass("active");
            $(this).parent().addClass("active");
          }
        });
      });
    }
  }

  scrollMove();

  function move(index) {
    var $thisTargetTop;

    $thisTargetTop =
      $panel.eq(index).offset().top +
      parseInt($panel.eq(index).css("padding-top")) / 2;

    $("html, body")
      .stop()
      .animate(
        {
          scrollTop: $thisTargetTop,
        },
        {
          duration: 500,
          // queue: false,
          complete: function () {
            //console.log('complete')
          },
        }
      );
  }
}

function tabMove2() {
  var $tab = $(".common-swiper_tab2 a");

  $tab.each(function () {
    $(this).on("click", function (e) {
      if ($(this).hasClass("is-link")) {
        sessionStorage.setItem("cur-st", $(window).scrollTop());
      }
      if ($(this).parents(".esg_welfare-tab").length) {
        var $thisTargetTop =
          $(this).parents(".layout_section_outer").offset().top +
          parseInt(
            $(this).parents(".layout_section_outer").css("padding-top")
          ) /
            2;

        $("html, body")
          .stop()
          .animate(
            {
              scrollTop: $thisTargetTop,
            },
            {
              duration: 500,
              // queue: false,
              complete: function () {
                //console.log('complete')
              },
            }
          );
      }

      // $(this).parent().siblings().removeClass('active');
      // $(this).parent().addClass('active');
    });
  });
}

function cssTransitionPreload() {
  $(".css-transitions-preload").each(function (index, element) {
    setTimeout(function () {
      $(element).removeClass("css-transitions-preload");
    }, 10);
  });
}

function tabActive(tabParent, panelParent) {
  var $tab = $(tabParent).children(),
    $panel = $(panelParent).children();

  $tab.on("click", function () {
    // console.log($(this).index());

    if (!$(this).find("a").is("is-link")) {
      $tab.removeClass("active");
      $(this).addClass("active");
    }

    $panel.removeClass("active");
    $panel.eq($(this).index()).addClass("active");
  });
}

function eduMemberChg() {
  var $obj = $(".esg_edu_member_area"),
    $select = $obj.find(".common-select_box"),
    $panel = $obj.children();

  $select.each(function () {
    $(this).on("change", function () {
      var $idx = $(this).find("option:selected").index();

      $select.eq($idx).find("option").eq($idx).prop("selected", true);
      $panel.removeClass("active");
      $panel.eq($idx).addClass("active");
    });
  });
}

function eduMemberMore() {
  var $btn = $(".member_list_more button");

  $btn.on("click", function () {
    $(".esg_edu_member_item.active .esg_member_list")
      .eq(0)
      .find("li:hidden")
      .slice(0, 10)
      .show();
    if (
      $(".esg_edu_member_item.active .esg_member_list").eq(0).find("li:hidden")
        .length === 0
    ) {
      $(this).parent().hide();
    }
  });
}

function eduMemberFaq() {
  var $btn = $(".education_volunteers-faq .btn_area .common-btn");

  $btn.on("click", function () {
    $(".education_volunteers-faq .faq_list")
      .eq(0)
      .find("li:hidden")
      .slice(0, 5)
      .show();
    if (
      $(".education_volunteers-faq .faq_list").eq(0).find("li:hidden")
        .length === 0
    ) {
      $(this).parent().hide();
    }
  });
}

function videoHeight() {
  var $obj = $(".video-wrapper");

  function autoHeight() {
    var $winH = $(window).outerHeight(),
      $headerH = $("#header").outerHeight();

    $obj.css("height", $winH - $headerH);
  }

  autoHeight();

  $(window).resize("resize", autoHeight);
}

function contactPopReset(target) {
  $obj = $(target).parents("#pop_customer");

  $obj.find("input, select, textarea").each(function () {
    $(this).val(""); // input, select, textarea 媛� 珥덇린��
    $(this).removeAttr("disabled");
    $("#businessDetail").attr("disabled", true);

    if ($(this).attr("type") == "file") {
      // 泥⑤��뚯씪 珥덇린��
      $(this).parent().find(".file_viewer-box").removeClass("active");
      $(this).parent().find(".file_viewer-txt").text("泥⑤��뚯씪�� �놁뒿�덈떎.");
    }

    if ($(this).attr("type") == "checkbox") {
      // checkbox 珥덇린��
      $(this).attr("checked", false).prop("checked", false);
    }
  });

  $obj
    .find(".common-select_box, .textfd_wrap, .textarea_wrap, .provision_area")
    .each(function () {
      $(this).removeClass("is-error");
    });

  $obj.find(".provision_box.scroll-content").scrollTop(0); // �쎄� �댁슜 �ㅽ겕濡ㅻ컮 珥덇린��
}

function btnScrollTop() {
  var $btn = $(".btn-scroll-top");

  $(window).on("scroll resize", function () {
    var $docH = $(document).height(),
      $winH = $(window).outerHeight(),
      $scrT = $(window).scrollTop(),
      $footT = $("#footer").outerHeight();

    if ($scrT >= $docH - $winH - $footT) {
      $btn.addClass("is-end");
    } else {
      $btn.removeClass("is-end");
    }

    if ($scrT >= $winH / 2 && $(window).width() >= 1024) {
      $btn.fadeIn(300);
    } else {
      $btn.fadeOut(300);
    }
  });

  $btn.on("click", function () {
    $("html, body").animate({ scrollTop: 0 }, 600);
  });
}

function mobileInputFocus() {
  if (/Android 4\.[0-3]/.test(navigator.appVersion)) {
    window.addEventListener("resize", function () {
      if (document.activeElement.tagName == "INPUT") {
        window.setTimeout(function () {
          document.activeElement.scrollIntoViewIfNeeded();
        }, 0);
      }
    });
  }
}

function newsPlayerWidth() {
  $(
    '.news .detail_body iframe[src*="youtube.com"], .news .detail_body iframe[src*="vimeo.com"]'
  ).each(function () {
    $(this).wrap('<div class="news-player-wrap"></div>');
  });
}

$(function () {
  /* �곷떒 �� */
  $(".common-swiper_tab").each(function (i, el) {
    var slides = $(el).find(".swiper-slide"),
      idx = Math.max(slides.filter(".active").index(), 0),
      $winW = $(window).width(),
      s = undefined,
      $tab = $(".common-swiper_tab a"),
      $panel = $('[data-js="anchor-target"]'),
      $subW = $(this).parents(".common-swiper_area").is(".sub-main")
        ? 1281
        : 1025;

    // if ( slides.eq(idx)[0].offsetLeft <= $(window).width() - slides.eq(idx).width() ) {
    //     console.log(slides.eq(idx)[0].offsetLeft)
    //     console.log(slides.eq(idx).width())
    //     idx = 0;
    // }

    function initSwiper() {
      if ($winW < $subW && s == undefined) {
        s = new Swiper(el, {
          initialSlide: idx,
          observer: true,
          observeParents: true,
          slidesPerView: "auto",
          on: {
            init: function () {
              console.log(el);
            },
            transitionEnd: function () {
              $(".common-swiper_area").eq(0).removeClass("is-end");
              if (this.isEnd) {
                $(".common-swiper_area").eq(0).addClass("is-end");
              }
            },
          },
        });

        function scrollMove() {
          $(window).on("load scroll resize", function () {
            $winW = $(window).width();
            if ($panel.length && $winW < 769) {
              // console.log(s)
              $tab.each(function () {
                var $panelIdx = $panel.eq($(this).parent().index()),
                  $docT = $(document).scrollTop();
                if ($docT > $panelIdx.offset().top) {
                  setTimeout(function () {
                    if (s != undefined) {
                      s.slideTo(slides.filter(".active").index());
                    }
                  }, 500);
                }
              });
              clickMove();
            }
          });
        }

        function clickMove() {
          slides.on("click", function () {
            if (s != undefined) {
              s.slideTo($(this).index());
            }
          });
        }

        scrollMove();
      } else if ($winW > 1024 && s != undefined) {
        s.destroy();
        s = undefined;
      }
    }

    initSwiper();

    $(window).on("resize", function () {
      $winW = $(window).width();
      initSwiper();
    });
  });

  /* �쒕퉬�� �뚭컻 */
  $(".main_biz_slider").each(function (i, el) {
    var slides = $(el).find(".swiper-slide");
    var $winW = $(window).width();
    var s = undefined;

    if (slides.length <= 1) {
      $(this).find(".swiper-wrapper").addClass("is-disabled");
      $(this).find(".swiper-pagination").addClass("is-disabled");
    }

    function initSwiper() {
      // console.log('init')
      if ($winW < 769 && s == undefined) {
        s = new Swiper(el, {
          initialSlide: 0,
          slidesPerView: 1,
          observer: true,
          observeParents: true,
          // pagination: {
          //     clickable : true,
          //     el: '.main_biz',
          //     type: 'bullets'
          // },
          breakpoints: {
            768: {
              slidesPerView: 2.15,
              spaceBetween: 0,
            },
            480: {
              slidesPerView: 1.15,
              spaceBetween: 0,
            },
          },
        });

        s.update();
      } else if ($winW > 768 && s != undefined) {
        // console.log('destory')
        s.destroy();
        s = undefined;
      }
    }

    initSwiper();

    $(window).on("resize", function () {
      $winW = $(window).width();
      initSwiper();
    });
  });

  /* 異붿쿇���� �щ씪�대뜑 */
  $(".recomm_biz_slider").each(function (i, el) {
    var $winW = $(window).width();
    var s = undefined;

    function initSwiper() {
      if ($winW < 769 && s == undefined) {
        s = new Swiper(el, {
          initialSlide: 0,
          slidesPerView: "auto",
          observeParents: true,
          observer: true,
          pagination: {
            el: ".recomm_biz",
            type: "bullets",
          },
          breakpoints: {
            768: {
              slidesPerView: 1,
              spaceBetween: 24,
            },
          },
        });

        s.update();
      } else if ($winW > 768 && s != undefined) {
        s.destroy();
        s = undefined;
      }
    }

    initSwiper();

    $(window).on("resize", function () {
      $winW = $(window).width();
      initSwiper();
    });
  });

  /* 二쇱슂 �쒕퉬�� �щ씪�대뜑 */
  $(".serv_list_slider").each(function (i, el) {
    var slides = $(el).find(".swiper-slide");
    var $winW = $(window).width();
    var s = undefined;

    if (slides.length <= 1) {
      $(this).find(".swiper-wrapper").addClass("is-disabled");
      $(this).find(".swiper-pagination").addClass("is-disabled");
    }

    function initSwiper() {
      if ($winW < 769 && s == undefined) {
        s = new Swiper(el, {
          initialSlide: 0,
          slidesPerView: "auto",
          observer: true,
          observeParents: true,
          breakpoints: {
            768: {
              slidesPerView: 2.15,
              spaceBetween: 24,
            },
            480: {
              slidesPerView: 1.15,
              spaceBetween: 24,
            },
          },
        });

        s.update();
      } else if ($winW > 768 && s != undefined) {
        s.destroy();
        s = undefined;
      }
    }

    initSwiper();

    $(window).on("resize", function () {
      $winW = $(window).width();
      initSwiper();
    });
  });

  $(".recomm_industry_slider").each(function (i, el) {
    var slides = $(el).find(".swiper-slide");
    var $winW = $(window).width();
    var s = undefined;

    if (slides.length <= 1) {
      $(this).find(".swiper-wrapper").addClass("is-disabled");
      $(this).find(".swiper-pagination").addClass("is-disabled");
    }

    function initSwiper() {
      if ($winW < 769 && s == undefined) {
        s = new Swiper(el, {
          initialSlide: 0,
          slidesPerView: "auto",
          observer: true,
          observeParents: true,
          breakpoints: {
            768: {
              slidesPerView: 2.15,
              spaceBetween: 24,
            },
            480: {
              slidesPerView: 1.15,
              spaceBetween: 24,
            },
          },
        });

        s.update();
      } else if ($winW > 768 && s != undefined) {
        s.destroy();
        s = undefined;
      }
    }

    initSwiper();

    $(window).on("resize", function () {
      $winW = $(window).width();
      initSwiper();
    });
  });

  /* �쒖슜�щ� �щ씪�대뜑 */
  $(".use_case_slider").each(function (i, el) {
    var slides = $(el).find(".swiper-slide");
    var $winW = $(window).width();
    var s = undefined;

    if (slides.length <= 1) {
      $(this).find(".swiper-wrapper").addClass("is-disabled");
      $(this).find(".swiper-pagination").addClass("is-disabled");
    }

    function initSwiper() {
      s = new Swiper(el, {
        initialSlide: 0,
        slidesPerView: "auto",
        observer: true,
        observeParents: true,
        spaceBetween: 24,
        // simulateTouch : false,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        breakpoints: {
          1280: {
            slidesPerView: "auto",
            spaceBetween: 24,
            // simulateTouch : true
          },
          1024: {
            slidesPerView: "auto",
            spaceBetween: 16,
            // simulateTouch : true
          },
          768: {
            slidesPerView: 2.15,
            spaceBetween: 16,
            // simulateTouch : true
          },
          600: {
            slidesPerView: 1.15,
            spaceBetween: 16,
            // simulateTouch : true
          },
        },
      });

      // s.update();

      if ($winW > 768) {
        s.slides.removeAttr("style");
        s.update();
      }
    }

    initSwiper();

    $(window).on("resize", function () {
      $winW = $(window).width();
      initSwiper();
    });
  });

  /* �뚭컻 �곸긽 */
  $(".common-movie_slider").each(function (i, el) {
    var slides = $(el).find(".swiper-slide");
    var $winW = $(window).width();
    var s = undefined;

    if (slides.length <= 1) {
      $(this).find(".swiper-wrapper").addClass("is-disabled");
    }

    function initSwiper() {
      s = new Swiper(el, {
        initialSlide: 0,
        slidesPerView: "auto",
        spaceBetween: 24,
        breakpoints: {
          1024: {
            slidesPerView: "auto",
          },
          768: {
            slidesPerView: 1.15,
            spaceBetween: 16,
          },
          480: {
            slidesPerView: 1.15,
            spaceBetween: 16,
          },
          375: {
            slidesPerView: 1,
            spaceBetween: 16,
          },
        },
      });

      // s.update();

      if ($winW > 768) {
        s.slides.removeAttr("style");
        s.update();
      }
    }

    initSwiper();

    $(window).on("resize", function () {
      $winW = $(window).width();
      initSwiper();
    });
  });

  $(".common-swiper_tab2").each(function (i, el) {
    var slides = $(el).find(".swiper-slide"),
      idx = Math.max(slides.filter(".active").index(), 0),
      $winW = $(window).width(),
      s = undefined;

    function initSwiper() {
      if ($winW < 1025 && s == undefined) {
        s = new Swiper(el, {
          initialSlide: idx,
          observer: true,
          observeParents: true,
          slidesPerView: "auto",
        });

        function clickMove() {
          slides.on("click", function () {
            s.slideTo($(this).index());
          });
        }

        slides.find("a").on("click", function (e) {
          if (!$(this).hasClass("is-link")) {
            e.preventDefault();
          }
        });

        clickMove();
      } else if ($winW > 1024 && s != undefined) {
        s.destroy();
        s = undefined;
      }
    }

    initSwiper();

    $(window).on("resize", function () {
      $winW = $(window).width();
      initSwiper();
    });
  });

  /*
	  $('.location_img_slider').each(function(i, el) {
		  var slides = $(el).find('.swiper-slide'),
			  $winW = $(window).width(),
			  s = undefined;
  
		  function initSwiper() {
			  s = new Swiper(el, {
				  initialSlide : 0,
				  slidesPerView: 1,
				  observer: true,
				  observeParents: true,
				  spaceBetween: 24,
				  pagination: {
					  clickable : true,
					  el: '.location-bullet',
					  type: 'bullets'
				  },
				  // simulateTouch : false,
				  navigation: {
					  nextEl: '.location-button-next',
					  prevEl: '.location-button-prev'
				  }
			  });
		  };
  
		  initSwiper();
	  });
	  */

  $(".esg_welfare_slider").each(function (i, el) {
    var $winW = $(window).width();
    var s = undefined;

    function initSwiper() {
      if ($winW < 769 && s == undefined) {
        s = new Swiper(el, {
          initialSlide: 0,
          slidesPerView: "auto",
          observeParents: true,
          observer: true,
          pagination: {
            el: ".esg_welfare_pagination",
            type: "bullets",
          },
          breakpoints: {
            768: {
              slidesPerView: 1,
              spaceBetween: 24,
            },
          },
        });

        s.update();
      } else if ($winW > 768 && s != undefined) {
        s.destroy();
        s = undefined;
      }
    }

    initSwiper();

    $(window).on("resize", function () {
      $winW = $(window).width();
      initSwiper();
    });
  });

  /* 湲곗닠 愿��� �숈쁺�� �щ씪�대뜑 */
  $(".tech_movie_slider").each(function (i, el) {
    var slides = $(el).find(".swiper-slide");
    var $winW = $(window).width();
    var s = undefined;

    if (slides.length <= 1) {
      $(this).find(".swiper-wrapper").addClass("is-disabled");
      $(this).find(".swiper-pagination").addClass("is-disabled");
    }

    function initSwiper() {
      s = new Swiper(el, {
        initialSlide: 0,
        slidesPerView: 2,
        observer: true,
        observeParents: true,
        spaceBetween: 24,
        // simulateTouch : false,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        breakpoints: {
          // 1280: {
          //     slidesPerView: 'auto',
          //     spaceBetween: 24
          //     // simulateTouch : true
          // },
          // 1024: {
          //     slidesPerView: 'auto',
          //     spaceBetween: 16
          //     // simulateTouch : true
          // },
          // 768: {
          //     slidesPerView: 2.15,
          //     spaceBetween: 16
          //     // simulateTouch : true
          // },
          // 600: {
          //     slidesPerView: 1.15,
          //     spaceBetween: 16
          //     // simulateTouch : true
          // }
          600: {
            slidesPerView: 1.15,
          },
        },
      });

      // s.update();

      if ($winW > 768) {
        s.slides.removeAttr("style");
        s.update();
      }
    }

    initSwiper();

    $(window).on("resize", function () {
      $winW = $(window).width();
      initSwiper();
    });
  });

  checkMobile();
  makeScroll();
  usePanelInit(".use_case_slider");
  usePanelInit(".culture_card_list");

  countInit();
  customScrollY(".provision_box");
  customScrollY(".use_case-scroll");
  customScrollY(".footer_layer_scroll");

  $(window).on("resize", makeScroll);
  $(window).on("resize", checkMobile);

  customFileUpload();
  faqInit();
  tabMove();
  tabMove2();

  cssTransitionPreload();

  tabActive(".common-swiper_tab2 .swiper-wrapper", ".tab-panel_area");
  tabActive(".esg_welfare-tab .swiper-wrapper", ".esg_welfare-panel");

  eduMemberChg();
  eduMemberMore();
  eduMemberFaq();

  videoHeight();

  btnScrollTop();

  setTimeout(function () {
    AOS.init();
  }, 100);

  mobileInputFocus();

  newsPlayerWidth();
});
