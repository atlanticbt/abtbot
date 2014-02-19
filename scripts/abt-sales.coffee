# Description:
#   Notify the sales room when a form is submitted on the ABT Website
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
  robot.router.post "/abt/sales", (req, res) ->
    robot.messageRoom "Dept:Sales", req.body.message
    res.end "Message Sent"
