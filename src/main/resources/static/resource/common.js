$('select[data-value]').each(function(index, el) {
  const $el = $(el);

  const defaultValue = $el.attr('data-value').trim();

  if ( defaultValue.length > 0 ) {
	$el.val(defaultValue);	
  }
});

$(document).ready(function () {
  $(".nav-toggler").each(function (_, navToggler) {
    var target = $(navToggler).data("target");
    $(navToggler).on("click", function () {
      $(target).animate({
        height: "toggle",
      });
    });
  });
});
