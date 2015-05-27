# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('#select_user_id').change ->
    $this = $(this)
    $.getJSON '/test.json?user_id=' + $this.val(), (data) ->
      console.log data
      $('.months_to_entitlement').html data.months_to_entitlement + ' Months'
      $('.weeks_to_entitlement').html data.weeks_to_entitlement + ' Weeks'
      $('.days_to_entitlement').html data.days_to_entitlement + ' Days'
      return
    return