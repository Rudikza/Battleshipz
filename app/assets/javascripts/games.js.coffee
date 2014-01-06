# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@GameOpponent =
  setUrl: ->
    url = $("#game_opponent :selected").attr('url')
    $("#game_opponent_url").val(url)

# Ready is needed here because of Turbolinks.
ready = ->
  GameOpponent.setUrl()

  $("#game_opponent").change ->
    GameOpponent.setUrl()

  $("#auto_start").click ->
    $('#myModal').foundation('reveal', 'open');

# These two lines work with the above ready method to ensure that
# our code is only loaded when the dom is ready.
$(document).ready(ready)
$(document).on('page:load', ready)
