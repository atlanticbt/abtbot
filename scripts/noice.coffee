# Description:
#   Display a random "noice" image
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   noice - displays a noice image
#
# Author:
#   jfoushee

module.exports = (robot) ->
  noices = [
    "http://www.tickld.com/cdn_image_thing/673081.jpg",
    "http://i.minus.com/itH4d2AyZoQL.gif",
    "http://imgur.com/4a4qAtE",
  ]

  robot.hear /(\W|^)no+i+c+e+($|\W)/i, (msg) ->
    msg.send msg.random noices
