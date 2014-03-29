// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Handle clicks on the link to cancel writing a review
$(document).on('click', '#cancel_review', function(evt) {
  evt.preventDefault();
  $('#review_form_container').hide();
});

// If review validation fails, display the returned form with errors
$(document).on('ajax:error', '#new_review', function(evt, xhr, status, error) {
  $('#review_form_container').html(xhr.responseText);
});