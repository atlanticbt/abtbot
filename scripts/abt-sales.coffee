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
    data = JSON.parse req.body.payload
    robot.messageRoom data.room, data.message
    res.end "Message Sent to #{req.body.room} #{req.params.room} #{data.room}"
