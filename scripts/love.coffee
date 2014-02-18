# Description:
#   Responds to "I love @abtbot"
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   None
#
# Author:
#   johnf

messages = [
  "Love is illogical",
  "I love lamp",
  "ERROR LOADING FEELINGS MODULE: EXECUTE AUTODESTRUCT (boom)",
  "404 Love Not Found",
  "<3",
  "Baby don't hurt me, don't hurt me, no more",
  "ACCEPTED: 1 LOVE UNIT",
  "/me beeps affectionately"
]

love = (msg) ->
  msg.send msg.random messages


module.exports = (robot) ->
  listen = new RegExp("I love( you)? @?"+robot.name+"","i")
  robot.hear listen, (msg) ->
    love msg
  robot.respond /I love you/i, (msg) ->
    love msg