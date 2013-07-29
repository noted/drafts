//= require ./lib/vendor/jquery.js
//= require_tree ./lib/vendor
//= require_tree ./lib
//= require_self

$(document).ready ->
  ligature()

  $('textarea').autosize()
