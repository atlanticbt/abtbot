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
    res.end "RESPONSE: #{req.body} #{req.body.payload} #{req.params}"
