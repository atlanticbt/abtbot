# Description:
#   Responds to "stand by"
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

module.exports = (robot) ->
  messages = [
    "/me croons 'Stand By Me'"
  ,"https://www.youtube.com/watch?v=Vbg7YoXiKn0"
  ,"So darling, DAR-ling\nStaaand... by me, ohhhhh staaand by me...\nOh staaand... stand by me"
  ,"No I won't... be afraid\nOh I won't... be a-fraid\nJust as long as you staaand... stand by me"]
  standby = (msg) ->
    msg.send msg.random messages
  robot.hear /(\s|^)stand by($|\W)/i, (msg) ->
    standby msg
