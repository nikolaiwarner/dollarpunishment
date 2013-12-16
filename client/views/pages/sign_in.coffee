Template.sign_in.events
  "click .login_with_google": ->
    Meteor.loginWithGoogle undefined, (error) ->
      if error
        Session.set('errorMessage', error.reason || 'Unknown error')
