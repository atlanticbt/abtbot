# Description:
#   Display a random "pun" image
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   #pun
#   pun me
#
# Author:
#   johnf

module.exports = (robot) ->
  images = []
  DAY = 1000 * 3600 * 24
  LAST_LOAD = null
  send = (msg, arr) ->
    image = msg.random arr
    msg.send image.link
  punme = (msg) ->
    NOW = new Date()
    if images.length && LAST_LOAD && !parseInt((NOW.getTime() - LAST_LOAD.getTime()) / DAY)
      send(msg, images)
    else
      url = 'https://api.imgur.com/3/gallery/album/bOc2Y/images'
      robot.http(url).header('Authorization', 'Client-ID a78f2905f8a424e').get() (err, res, body) ->
        try
          response = JSON.parse(body)
          images = response.data
          LAST_LOAD = new Date()
          send(msg, images)
        catch error
          msg.send "Unable to retrieve puns :("
  robot.respond /pun me/i, (msg) ->
    punme msg
  robot.hear /(\s|^)\#(bad|terrible|awful|hilarious|great)?puns?($|\W)/i, (msg) ->
    punme msg
