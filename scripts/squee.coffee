# Description:
#   reacts to squee gif
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   squee - FEAR THE FORCE
#
# Author:
#   johnf

squee = (msg) ->
  msg.send "http://www.youtube.com/watch?v=HUjp-4ejk10"
  msg.send "https://s3.amazonaws.com/uploads.hipchat.com/85651/619651/B9qAiKjJnJJfnZn/wes-we-can.jpg"
  msg.send "WES WE CAN! WES WE CAN!"

module.exports = (robot) ->
  robot.hear /(\#|\s|^)squee+($|\W)/i, (msg) ->
    squee msg
  robot.hear /(\#|\s|^)weswecan($|\W)/i, (msg) ->
    squee msg
