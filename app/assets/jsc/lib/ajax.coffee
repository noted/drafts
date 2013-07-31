# Drafts
#   file: lib/ajax.coffee

$(document).ready ->
  $(window).keypress (event) ->
    return true if not (event.which is 115 and event.ctrlKey) and (event.which isnt 19)
    save()
    event.preventDefault()
    false


  $("form.note.ajax button").on "click", (e) ->
    e.preventDefault()

    $("span.status").html("Saving...")

    save()

  if $("form.note.ajax").length
    setInterval (->
      save()
    ), 30000

  save = ->
    data = {
      current_user: $("form.note .current_user").val()
      note: {
        id: $("form.note .id").val()
        title: $("form.note .title").val()
        text: $("form.note .text").val()
        tags: $("form.note input[name='note[tags]']").val()
      }
    }

    $.ajax
      type: 'PATCH'
      data: data
      url: '/api/notes/update.json'
      error: (err) ->
        console.log err

        $("form.note.ajax button").removeClass "green"
        $("form.note.ajax button").addClass "red"
        $("form.note.ajax button").html "Failed to save!"
      success: (res) ->
        $("form.note.ajax button").removeClass "red"
        $("form.note.ajax button").addClass "green"
        $("form.note.ajax button").html "Save"

        setTimeout ( ->
          $("form.note.ajax button").removeClass "green"
        ), 1000
