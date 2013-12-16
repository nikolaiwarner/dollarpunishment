Template.punishments_index.helpers
  punishments: ->
    Punishments.find {userId: Meteor.userId()}

Template.punishments_index.rendered = ->
  $('.punishment_list').masonry
    itemSelector : '.punishment_item'
