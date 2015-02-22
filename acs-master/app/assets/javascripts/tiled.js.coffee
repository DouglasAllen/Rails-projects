# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class window.TiledDisplay
  constructor: (@canvas, @tiles, @terrain_name = "global") ->

  draw: () ->
    context = @canvas.getContext('2d')
    terrain = window.Terrains[@terrain_name]

    width = terrain["width"]
    height = terrain["height"]

    dx = 0
    dy = 0

    # Store the current transformation matrix
    context.save();

    # Use the identity matrix while clearing the canvas
    context.setTransform(1, 0, 0, 1, 0, 0);
    context.clearRect(0, 0, @canvas.width, @canvas.height);

    # Restore the transform
    context.restore();

    for row in @tiles
      for column in row
        terrain_list = column
        if typeof(column) == "string"
          terrain_list = [ column ]

        # TODO: draw with scaling
        for terrain_image in terrain_list
          context.drawImage terrain[terrain_image], dx, dy
          console.debug("Draw image #{terrain[terrain_image].src} at #{dx}, #{dy}")

        dx += width
      dx = 0
      dy += height
