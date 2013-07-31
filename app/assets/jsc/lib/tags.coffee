# Drafts
#   file: lib/tags.coffee

$(document).ready ->
  $("input.tags").selectize
    delimiter: ","
    persist: false
    create: (input) ->
      value: input
      text: input
