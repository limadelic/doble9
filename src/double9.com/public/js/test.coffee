$(document).ready ->
  canvas = $('canvas')[0]
  ctx = canvas.getContext '2d'
  ctx.fillRect 10, 20, 50, 50