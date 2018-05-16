# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('#todo-tags').tagit
    fieldName:   'tag_list'
    singleField: true
  $('#todo-tags').tagit()
  tag_string = $("#tag_hidden").val()
  try
    tag_list = tag_string.split(',')
    for tag in tag_list
      $('#todo-tags').tagit 'createTag', tag
  catch error
