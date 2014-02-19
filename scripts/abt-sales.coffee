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
    robot.messageRoom req.params.room, req.params.message
    res.end "Message Sent to #{req.body.room} #{req.params.room}"
