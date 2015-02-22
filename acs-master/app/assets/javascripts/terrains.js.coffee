# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ () ->
  $(".newTerrainButton").click () ->
    # alert "new terrain button!"


# Dropdown JS stolen from http://www.jankoatwarpspeed.com/wp-content/uploads/examples/reinventing-drop-down/#
# then generalized and CoffeeScript-ified.
$ () ->
    getDropDown = (element) ->
        $(element).parents "dl.dropdown"

    $(".dropdown dt a").click (e) ->
        dropdown = getDropDown this
        dropdown.find("dd ul").show()
        false

    getSelectedValue = (element) ->
        $(element).find("dt a span.value").html()

    $(".dropdown dd ul li a").click () ->
        text = $(this).html()
        dropdown = getDropDown this
        dropdown.find("dt a span").html text
        dropdown.find("dd ul").hide()
        dropdown.prev().find(".dropdown_result").val(getSelectedValue dropdown)
        false

    $(document).bind 'click', (e) ->
        $clicked = $(e.target)
        if ! $clicked.parents().hasClass("dropdown")
            $(".dropdown dd ul").hide()
