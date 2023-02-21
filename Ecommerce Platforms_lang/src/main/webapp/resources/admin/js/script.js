var locale = $("input[name='locale']").val();

if (locale == "ko") {
  $("[id=locale_ko]")
    .removeClass("btn btn-default")
    .addClass("btn btn-primary");
  $("[id=locale_en]")
    .removeClass("btn btn-primary")
    .addClass("btn btn-default");
} else if (locale == "en") {
  $("[id=locale_en]")
    .removeClass("btn btn-default")
    .addClass("btn btn-primary");
  $("[id=locale_ko]")
    .removeClass("btn btn-primary")
    .addClass("btn btn-default");
}
