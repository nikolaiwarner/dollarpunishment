Template.punishments_show.events
  "click .punish": (event) ->
    Punishments.update @_id, {$inc: {dollars: 1}}, (error, result) ->
       console.log error, result

Template.punishments_show.helpers
  punishment: ->
    Punishments.findOne Session.get("selectedPunishment")
