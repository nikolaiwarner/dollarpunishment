Router.configure
  layoutTemplate: 'layout'
  notFoundTemplate: 'not_found'
  loadingTemplate: 'loading'

Router.map ->
  @route 'home',
    path: '/'
    template: 'sign_in'
    before: ->
      if Meteor.user()
        Router.go('/punishments/')
      else
        Router.go('sign_in')

  @route 'sign_in',
    path: '/sign_in'
    template: 'sign_in'
    before: ->
      if Meteor.user()
        Router.go('/punishments')

  @route 'sign_out',
    path: '/sign_out'
    before: ->
      Meteor.logout ->
        Router.go('home')

  @route 'punishments/index',
    path: 'punishments'
    template: 'punishments_index'
    waitOn: ->
      Meteor.subscribe "punishments", Meteor.userId()
    before: ->
      if !Meteor.user()
        Router.go('/')

  @route 'punishments/new',
    template: 'punishments_new'
    waitOn: ->
      Meteor.subscribe "punishments", Meteor.userId()
    before: ->
      if !Meteor.user()
        Router.go('/')
       Session.set("selectedPunishment", undefined)

  @route 'punishments/:_id/edit',
    template: 'punishments_edit'
    waitOn: ->
      Meteor.subscribe "punishments", Meteor.userId()
    before: ->
      if !Meteor.user()
        Router.go('/')
       Session.set("selectedPunishment", @params._id)

  @route 'punishments_show',
    path: '/punishments/:_id'
    waitOn: ->
      Meteor.subscribe "punishments", Meteor.userId()
    before: ->
      if !Meteor.user()
        Router.go('/')
      Session.set("selectedPunishment", @params._id)
