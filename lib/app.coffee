@Punishments = new Meteor.Collection2 "punishments",
  schema:
    userId:
      type: String,
      label: "User ID",
      max: 100
    name:
      type: String,
      label: "Name",
      max: 200
    description:
      type: String,
      label: "Description",
      max: 500,
      optional: true
    dollars:
      type: Number,
      label: "Dollars",
      min: 0

@Punishments.allow
  insert: (userId, doc) ->
    userId && (doc.userId == userId)

  update: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)

  remove: (userId, doc, fieldNames, modifier) ->
    userId && (doc.userId == userId)
