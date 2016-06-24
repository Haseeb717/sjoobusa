# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#feedback_contribution_to_sales_do_not_apply').click ->
    isDisabled = $('#feedback_contribution_to_sales_do_not_apply').prop('checked')
    if isDisabled
      $('#feedback_contribution_to_sales').prop 'disabled', true
    else
      $('#feedback_contribution_to_sales').removeAttr 'disabled'
    return
  return
