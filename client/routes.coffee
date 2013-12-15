Router.configure
  layoutTemplate: 'signed_out'
  notFoundTemplate: 'not_found'
  loadingTemplate: 'loading'

Router.map ->
  @route 'home',
    path: '/'
    template: 'sign_in'
    before: ->
      if Meteor.user()
        Router.go('punishments/index')

  @route 'punishments/index',
    path: 'punishments'
    template: 'punishments_index'
    layoutTemplate: 'signed_in'
    waitOn: ->
      Meteor.subscribe "punishments", Meteor.userId()
    before: ->
      if !Meteor.user()
        Router.go('/')

  @route 'punishments/new',
    template: 'punishments_new'
    layoutTemplate: 'signed_in'
    waitOn: ->
      Meteor.subscribe "punishments", Meteor.userId()
    before: ->
      if !Meteor.user()
        Router.go('/')
       Session.set("selectedPunishment", undefined)

  @route 'punishments/:_id/edit',
    template: 'punishments_edit'
    layoutTemplate: 'signed_in'
    waitOn: ->
      Meteor.subscribe "punishments", Meteor.userId()
    before: ->
      if !Meteor.user()
        Router.go('/')
       Session.set("selectedPunishment", @params._id)

  @route 'punishments_show',
    path: '/punishments/:_id'
    layoutTemplate: 'signed_in'
    waitOn: ->
      Meteor.subscribe "punishments", Meteor.userId()
    before: ->
      if !Meteor.user()
        Router.go('/')
      Session.set("selectedPunishment", @params._id)
