# Description
#   Allows user to submit haikus
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot haiku me - Return a random haiku
#   <trigger> - <what the hear trigger does>
#
# Notes:
#   None
#
# Author:
#   fousheezy

module.exports = (robot) ->
  robot.respond /haiku me(\s*)?$/i, (msg) ->
    msg.send "Haikus are easy\nBut sometimes they don't make sense\nRefrigerator"
