punishmentsForm = new AutoForm(Punishments)

punishmentsForm.hooks
  after:
    insert: (error, result, template) ->
      unless error
        Router.go("/punishments/#{result}")
    update: (error, result, template) ->
      unless error
        Router.go("/punishments/#{template.data._doc._id}")
    remove: (error, result, template) ->
      unless error
        Router.go("/punishments/")

Template.punishment_form.helpers
  schema: ->
    punishmentsForm
  selectedPunishment: ->
    Punishments.findOne(Session.get("selectedPunishment"))
  userId: ->
    Meteor.userId()
  randomNamePlaceholder: ->
    names = ["Chewing gum", "Sleeping in late", "Drinking too much"]
    _.sample(names)
  newPunishment: ->
    !Session.get("selectedPunishment")
