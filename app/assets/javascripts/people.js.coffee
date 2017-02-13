# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', () ->
  $('#edit-person, #cancel-edit-person').on 'click', (e) ->
    e.preventDefault()
    $('.form, .buttons').toggleClass('hidden')
