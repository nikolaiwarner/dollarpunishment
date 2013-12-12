Template.punishments_index.helpers
  punishments: ->
    Punishments.find {userId: Meteor.userId()}
