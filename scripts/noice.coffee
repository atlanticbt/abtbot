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
    "http://media.tumblr.com/b1c9139703327d682f4941b2e15c049b/tumblr_inline_mt2z4lu4rM1roj5qj.png",
    "http://imgur.com/Ghfosiv",
    "http://imgur.com/gvgDEVo",

  ]

  robot.hear /(\W|^)no+i+c+e+($|\W)/i, (msg) ->
    msg.send msg.random noices
