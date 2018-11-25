# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.best_in_place').best_in_place()
  $.datepicker.setDefaults({
    showOn: "both",
    buttonImageOnly: true,
    changeYear: true,
    changeMonth: true,
    yearRange: "1900:2018",
    dateFormat: 'dd-mm-yy'
  });

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()