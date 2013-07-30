$("form.note.ajax button").on "click", (e) ->
  e.preventDefault()

  $("span.status").html("Saving...")

  save()

if $("form.note.ajax").length
  setInterval (->
    save()
  ), 30000

save = ->
  $("span.status").html("Saving...")

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

      $("span.status").addClass "error"
      $("span.status").html "Failed to save!"
      $("span.status").fadeIn()
    success: (res) ->
      console.log res

      $("span.status").html "Saved!"
      $("span.status").fadeIn()

      # setTimeout (->
      #   $("span.status").fadeOut()
      #   $("span.status").val ""
      # ), 10000
