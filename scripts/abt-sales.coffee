# Description:
#   Notify the a room when a HTTP request is made
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#
# Author:
#   johnf

module.exports = (robot) ->
  robot.router.post "/abt/room", (req, res) ->
    robot.messageRoom req.body.room, req.body.message
    res.end "Message Sent to #{req.body.room}"
