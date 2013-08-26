//= require_tree ./lib/vendor
//= require_tree ./lib

//= require_self

$(document).ready ->
  # ligature()

  $('#editor').autosize()

  # BehaveHooks.add ["keydown"], (data) ->
  #   numLines = data.lines.total
  #   fontSize = parseInt(getComputedStyle(data.editor.element)["font-size"])
  #   padding = parseInt(getComputedStyle(data.editor.element)["padding"])
  #   data.editor.element.style.height = ((numLines * fontSize) + padding) + "px"

  # editor = new Behave(
  #   textarea: document.getElementById('editor')
  #   replaceTab: true
  #   softTabs: true
  #   tabSize: 2
  #   autoOpen: true
  #   overwrite: true
  #   autoStrip: true
  #   autoIndent: true
  # )
