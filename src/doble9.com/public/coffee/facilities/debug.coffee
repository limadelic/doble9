define [], () ->

  window.p = (x) -> console.log JSON.stringify x

  window.opt = (x) -> p (name for name of x)