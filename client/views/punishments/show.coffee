Template.punishments_show.events
  "click .punish": (event) ->
    Punishments.update @_id, {$push: {occurrences: new Date}}
    if @increment == undefined
      @increment = 1
    if @increment > 0
      Punishments.update @_id, {$inc: {dollars: @increment}}
    alert "You are punished! \n\n Go save $#{@dollars + @increment} now. \n\n This will only get worse."
    if @description
      alert @description

Template.punishments_show.helpers
  punishment: ->
    Punishments.findOne Session.get("selectedPunishment")
  format_date: (date) ->
    moment(date).format('LLL')
