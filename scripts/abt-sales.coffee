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
    try
      if req.body.room?
        robot.messageRoom req.body.room, req.body.message
      res.end "RESPONSE: #{req.body.room} #{req.body.message}"
    catch err
      console.log err
      robot.emit 'error', err
