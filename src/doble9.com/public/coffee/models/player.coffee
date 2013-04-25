define ['backbone', 'underscore'],
(Backbone, _) ->

  class Player extends Backbone.Model

    constructor: (@name) ->
