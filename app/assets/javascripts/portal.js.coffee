# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  $('#gettweet_button')
    .on 'click', (event) ->
      $.blockUI();

  $('#gettweet_form')
    .on 'ajax:complete',  (event, ajax, status) ->
      setInterval $.unblockUI, 2000
  $('#timeline')
    .bottom {proximity: 0}

  $('#timeline')
    .on 'bottom', (event) ->
      $('#gettweet_button').click()

  $('#connect_form')
    .on 'ajax:complete',  (event, ajax, status) ->
      $('#relations_button').click()