punishmentsForm = new AutoForm(Punishments)

punishmentsForm.hooks
  after:
    insert: (error, result, template) ->
      Router.go("/punishments/#{result}")

Template.punishment_form.helpers
  schema: ->
    punishmentsForm
  selectedDoc: ->
    Punishments.findOne(Session.get("selectedDoc"))
  userId: ->
    Meteor.userId()
