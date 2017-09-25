/* Nav Change */
$(window).scroll(function() {
  var scroll = $(window).scrollTop();

  if (scroll >= 80) {
    $(".navbar-brand img").removeClass("img-brand");
    $(".navbar-brand img").addClass("new-brand");

    $("nav").removeClass("transparent");
    $("nav").addClass("nav-flat");
    $("nav").addClass("fixed-top");

  } else {
    $(".navbar-brand img").removeClass("new-brand");
    $(".navbar-brand img").addClass("img-brand");

    $("nav").removeClass("nav-flat");
    $("nav").addClass("transparent");
    $("nav").removeClass("fixed-top");
  }
});
