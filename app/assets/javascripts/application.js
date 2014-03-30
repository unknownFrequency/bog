// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require_tree .


// For elements with a data-update-target attribute, update element HTML with ajax
// response and scroll to the element.

$(document).on('ajax:success', '[data-update-target]', function(evt, data) {
  var targetId = $(this).data('update-target');
  var target = $('#' + targetId);
  target.html(data).show();
  target.scrollTo();
});

// From: http://www.abeautifulsite.net/blog/2010/01/smoothly-scroll-to-an-element-without-a-jquery-plugin/
jQuery.fn.scrollTo = function() {
  $('html, body').animate({
    scrollTop: $(this).offset().top
  }, 500);
  return this;
}


// Add highligt method to jQuery without plugin
// From: http://stackoverflow.com/questions/848797/yellow-fade-effect-with-jquery/13106698#13106698
jQuery.fn.highlight = function(options) {
  opts = options || {};
  duration = opts.duration || 1000;
  opacity = opts.opacity || ".7";
  bgColor = opts.bgColor || "#428bca";

  $(this).each(function () {
    var el = $(this);
    $("<div/>")
    .width(el.outerWidth())
    .height(el.outerHeight())
    .css({
      "position": "absolute",
      "left": el.offset().left,
      "top": el.offset().top,
      "background-color": bgColor,
      "opacity": opacity,
      "z-index": "9999999"
    }).appendTo('body').fadeOut(duration).queue(function () { $(this).remove(); });
  });
}