# Description:
#   Auth allows you to assign roles to users which can be used by other scripts
#   to restrict access to Hubot commands
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_AUTH_ADMIN - A comma separate list of user IDs
#
# Commands:
#   hubot assign <user> to role <role> - Assigns a role to a user
#   hubot unassign <user> to role <role> - Removes a role from a user
#   hubot auth <user> - Find out what roles are assigned to a specific user
#   hubot who are admins - Find out who is an admin
#
# Notes:
#   * Call the method: robot.auth.hasRole(msg.envelope.user,'<role>')
#   * returns bool true or false
#
#   * the 'admin' role can only be assigned through the environment variable
#   * roles are all transformed to lower case
#
#   * The script assumes that user IDs will be unique on the service end as to
#     correctly identify a user. Names were insecure as a user could impersonate
#     a user
#
# Author:
#   jfoushee

module.exports = (robot) ->

  unless process.env.HUBOT_AUTH_ADMIN?
    robot.logger.warning 'The HUBOT_AUTH_ADMIN environment variable not set'

  if process.env.HUBOT_AUTH_ADMIN?
    admins = process.env.HUBOT_AUTH_ADMIN.split ','
  else
    admins = []

  class Auth
    hasRole: (user, roles) ->
      user = robot.brain.userForId(user.id)
      if user? and user.roles?
        roles = [roles] if typeof roles is 'string'
        for role in roles
          return true if role in user.roles
      return false

    usersWithRole: (role) ->
      users = []
      for own key, user of robot.brain.data.users
        if robot.auth.hasRole(msg.envelope.user, role)
          users.push(user)
      users

  robot.auth = new Auth

  find = (username, msg) ->
    if username.length < 1
      msg.send "Please specify a user"
      return;
    users = robot.brain.usersForFuzzyName username
    if users.length < 1
      msg.send "No users #{username} were found"
      return
    if users.length != 1
      msg.send "Multiple users found: #{users.length}"
      return
    users[0]


  robot.respond /assign\s+@?(.+) to role\s+(.+)/i, (msg) ->
    username = msg.match[1].trim()
    role = msg.match[2].trim().toLowerCase()
    user = find username, msg
    # ready to assign role
    user.roles ?= []
    if role in user.roles
      msg.reply "#{username} already has the role '#{role}"
    else
      if role == 'admin'
        msg.reply "Admin is a reserved role"
      else
        if msg.message.user.id in admins || msg.message.user.name in admins
          user.roles.push role
          msg.reply "#{username} has now been assigned the #{role} role"
        else
          msg.reply "You do not have the power to assign roles"

  robot.respond /unassign\s+@?(.+) to role\s+(.+)/i, (msg) ->
    username = msg.match[1].trim()
    role = msg.match[2].trim().toLowerCase()
    user = find username, msg
    user.roles ?= []
    if role == 'admin'
      msg.reply "#{role} cannot be unassigned"
      return
    unless msg.message.user.id in admins || msg.message.user.name in admins
      msg.reply "You cannot unassign roles"
    for userrole,index in user.roles
      if userrole is role
        user.roles.splice index,1
        msg.reply "#{user.name} no longer has role #{role}"
        return;
    msg.reply "#{user.name} does not have role #{role}"
  robot.respond /roles for\s+(.+)/i, (msg) ->
    username = msg.match[1].trim()
    user = find username, msg
    user.roles ?= []
    if user.roles.length < 1
      msg.send "#{username} has no roles"
    else
      msg.send "#{username} has the following roles: #{user.roles.join ', '}"

  robot.respond /who are admins/i, (msg) ->
    msg.send "Admins: #{admins}"