draw = ->

  canvas = $('canvas')[0]
  canvas.width = window.innerWidth
  canvas.height = window.innerHeight

  ctx = canvas.getContext '2d'

  img = $('<img src="img/domino.jpg" />')[0]
  img.onload = ->
    ctx.fillStyle = ctx.createPattern @, 'repeat'
    ctx.fillRect 0, 0, canvas.width, canvas.height

$(document).ready draw
$(window).resize draw