// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Handle clicks on the link to cancel writing a review
$(document).on('click', '#cancel_review', function(evt) {
  evt.preventDefault();
  $('#review_form_container').hide();
});

// If review was saved, dispay new review and compute new review count and average.
// NOTE: This will break if pagination is added to reviews.
$(document).on('ajax:success', '#new_review', function(evt, html, status) {
  $('#reviews').prepend(html);
  $('#reviews li:first').scrollTo().highlight();
  $('#review_form_container').hide();
  var review_count = $('#reviews li').size();
  var stars = 0;
  $('#reviews li .stars').each(function() {
    stars += Number($(this).html().split(' ')[0]);
  })
  var avg_stars = stars/review_count;
  var message = "("+review_count+" reviews, average " + Math.round(avg_stars*10)/10 + " stars)";
  $('#review_count').html(message);
});

// If review validation fails, display the returned form with errors
$(document).on('ajax:error', '#new_review', function(evt, xhr, status, error) {
  $('#review_form_container').html(xhr.responseText);
});