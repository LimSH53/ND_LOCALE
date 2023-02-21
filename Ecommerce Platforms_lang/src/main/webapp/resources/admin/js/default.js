var swiper = new Swiper(".slider", {
  effect: "fade",
  loop: true,
  autoplay: {
    delay: 4000,
    disableOnInteraction: false,
  },
});

var swiper2 = new Swiper(".mid", {
  slidesPerView: 3,
  spaceBetween: 90,
  slidesPerGroup: 1,
  loop: true,
  loopFillGroupWithBlank: true,
  pagination: {
    el: ".swiper-pagination",
    clickable: true,
  },
  navigation: {
    nextEl: ".swiper-button-next",
    prevEl: ".swiper-button-prev",
  },
  autoplay: {
    delay: 4800,
    disableOnInteraction: false,
  },
});

$(".mid").each(function (elem, target) {
  var swp = target.swiper;
  $(this).hover(
    function () {
      swp.autoplay.stop();
    },
    function () {
      swp.autoplay.start();
    }
  );
});
