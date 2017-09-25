/* Nav Change */
$(window).scroll(function() {
  var scroll = $(window).scrollTop();

  if (scroll >= 100) {
    $(".navbar-brand img").removeClass("img-brand");
    $(".navbar-brand img").addClass("new-brand");

    $("nav").removeClass("transparent");
    $("nav").addClass("nav-flat");

  } else {
    $(".navbar-brand img").removeClass("new-brand");
    $(".navbar-brand img").addClass("img-brand");

    $("nav").removeClass("nav-flat");
    $("nav").addClass("transparent");
  }
});