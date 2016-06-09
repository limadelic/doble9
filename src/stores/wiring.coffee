module.exports = (store) ->

  store.subscribe ->
    state = store.getState()
    { action } = state
    store.dispatch { type: "after_#{action.type}", state } 
  

  store