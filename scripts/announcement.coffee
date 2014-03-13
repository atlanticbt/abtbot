# Description:
#   Send messages to all users
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot announce "<message>" - Sends a message to all hubot rooms.
#   hubot announce downtime for "<service>" starting <timeframe> - Syntactic sugar for announcing downtime commencement
#   hubot announce downtime complete for "<service>" - Syntactic sugar for announcing downtime completion
#   hubot announce list - show all users announcements will go to
#
# Author:
#   jfoushee
#
# URLS:
#   /broadcast/create - Send a message to designated, comma-separated rooms.

module.exports = (robot) ->
  clone = (obj) ->
    if not obj? or typeof obj isnt 'object'
      return obj

    if obj instanceof Date
      return new Date(obj.getTime())

    if obj instanceof RegExp
      flags = ''
      flags += 'g' if obj.global?
      flags += 'i' if obj.ignoreCase?
      flags += 'm' if obj.multiline?
      flags += 'y' if obj.sticky?
      return new RegExp(obj.source, flags)

    newInstance = new obj.constructor()

    for key of obj
      newInstance[key] = clone obj[key]

    return newInstance
  expressObject = (obj, indent) ->
    if typeof obj == 'object'
      str = ''
      for k,v of obj
        str += "#{indent}[#{k}] => #{expressObject v,indent+'  '},\n"
      return str
    if typeof obj == 'array'
      str = ''
      for i in obj
        str += "#{indent}[#{i}] => #{expressObject obj[i],indent+'  '},\n"
      return str
    return obj

  announceMessage = (message) ->
    users = robot.brain.users()
    for id,user of users
      try
        u = clone user
        u.reply_to = u.jid if robot.adapter is "hipchat"
        robot.send u, message
      catch err
        console.log err

  authorize = (msg) ->
    try
      return robot.auth.hasRole msg.message.user, 'announce'
    catch err
      console.log err
    return false


  robot.respond /announce "(.*)"/i, (msg) ->
    unless (authorize msg)
      msg.reply "You do not have announce permission"
      return
    msg.reply "Alright, I will announce: #{msg.match[1]}"
    announcement = "#{msg.message.user.name} wants to announce: #{msg.match[1]}"
    announceMessage announcement

  robot.respond /announce downtime for "(.*)" starting (.*)/i, (msg) ->
    unless (authorize msg)
      msg.reply "You do not have announce permission"
      return
    user = msg.message.user
    service = msg.match[1]
    startTime = msg.match[2]

    message = ["The '#{service}' service will be going down for maintenance starting #{startTime}.",
               "If you have questions about this maintenance, please talk to #{user.name} in the the #{user.room} room.  Thank you for your patience."]

    announceMessage message
    msg.reply "Don't forget to pause monitoring for this service."

  robot.respond /announce downtime complete for "(.*)"/i, (msg) ->
    unless (authorize msg)
      msg.reply "You do not have announce permission"
      return
    service = msg.match[1]
    announceMessage "Maintenance for the '#{service}' service is complete."
    msg.reply "Don't forget to resume monitoring for this service."

  robot.respond /announce list/i, (msg) ->
#    unless (authorize msg)
#      msg.reply "You do not have announce permission"
#      return
    users = robot.brain.users()
    list = []
    for id of users
      list.push users[id].name
    msg.send "An announcement will go to the following users: #{list.join '\n'}"

  robot.respond /announce details/i, (msg) ->
    if robot.auth.hasRole msg.message.user, 'announce'
      msg.send "Here are user details"
      users = robot.brain.users()
      for id,user of users
        msg.send "User: #{id} #{expressObject user,''}"
        break
