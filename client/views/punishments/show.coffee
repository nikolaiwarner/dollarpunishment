Template.punishments_show.events
  "click .punish": (event) ->
    Punishments.update @_id, {$inc: {dollars: 1}}, (error, result) =>
      alert "You are punished! \n\n Go save $#{@dollars + 1} now. \n\n This will only get worse."
      if @description
        alert @description

Template.punishments_show.helpers
  punishment: ->
    Punishments.findOne Session.get("selectedPunishment")
