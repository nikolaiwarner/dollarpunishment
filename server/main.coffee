Meteor.publish "punishments", (userId) ->
  Punishments.find {userId: userId}, {sort: {name: 1}}
