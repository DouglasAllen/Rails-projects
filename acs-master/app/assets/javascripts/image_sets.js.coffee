# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "change", ".files_input", () ->
  $(".image_previews img").remove()
  handleFiles($(".files_input")[0].files)

handleReaderLoad = (evt, dest) ->
  console.debug "Reading into #{dest}!"
  $(".image_previews").append($("<img id='preview_#{dest}'> </img>"))
  console.debug "Reading into #preview_#{dest}"
  img = $(".image_previews #preview_#{dest}")[0]
  img.src = evt.target.result

handleFiles = (files) ->
  offset = 1
  for file in files
    do ->
      local_offset = offset  # freeze value
      reader = new FileReader

      # init the reader event handlers
      reader.onload = (evt) ->
        handleReaderLoad(evt, local_offset)

      # begin the read operation
      reader.readAsDataURL(file)

      offset++
