$(function () {
  $(".main-course .course-list--fc").slick({
    dots: false,
    infinite: true,
    arrows: true,
    slidesToShow: 3,
    speed: 600,
    autoplay: true,
    autoplaySpeed: 3000,
    pauseOnHover: false,
    prevArrow: $(this).find(".main-course-btns .prev"),
    nextArrow: $(this).find(".main-course-btns .next"),
    responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2,
        },
      },
      {
        breakpoint: 576,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
        },
      },
    ],
  });

  $(".main-gallery .webzine-list--latest").slick({
    dots: false,
    infinite: true,
    arrows: true,
    slidesToShow: 4,
    speed: 600,
    autoplay: true,
    autoplaySpeed: 3000,
    pauseOnHover: false,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2,
        },
      },
      {
        breakpoint: 576,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
        },
      },
    ],
  });

  $(".main-review .webzine-list--latest").slick({
    dots: false,
    infinite: true,
    arrows: true,
    slidesToShow: 2,
    speed: 600,
    autoplay: true,
    autoplaySpeed: 4000,
    adaptiveHeight: true,
    pauseOnHover: false,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1,
          arrows: false,
          dots: true,
        },
      },
    ],
  });
});
