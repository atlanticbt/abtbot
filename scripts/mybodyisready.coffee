# Description:
#   Display a random "my body is ready" image
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   my body is ready
#
# Author:
#   johnf

module.exports = (robot) ->
  isready = [
    "http://i.minus.com/i8v9tlMu6oFfD.gif"
    ,"http://media.tumblr.com/tumblr_lhfgyo23nq1qbme8m.gif"
    ,"https://i.chzbgr.com/maxW500/6503692032/h809D8699/"
  ]
  robot.hear /(\s|^)my (.+?) (is|are) ready($|\W)/i, (msg) ->
    msg.send msg.random isready
