define [], () ->

  window.p = (x) -> console.log JSON.stringify x

  window.m = (x) -> p (name for name of x)