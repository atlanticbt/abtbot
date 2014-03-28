# Description:
#   Display a random "bitch please" image
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   haters - Returns a random haters gonna hate url
#
# Author:
#   johnf


module.exports = (robot) ->
  images = [
    "http://robbmantovani.files.wordpress.com/2013/01/bitch-please-random-30570804-440-330.jpg"
  , "http://digboston.com/wp-content/uploads/2013/08/wonder-woman-bitch-please1.jpg"
  , "http://fc04.deviantart.net/fs70/f/2010/320/f/d/bitch_please_by_teslapunk-d32znko.jpg"
  , "http://i1.sndcdn.com/artworks-000038372995-e221wg-original.jpg?435a760"
  , "http://www.vitamin-ha.com/wp-content/uploads/2012/10/Vh-robert-bitch-please.jpg"
  , "http://fc09.deviantart.net/fs70/i/2011/153/0/1/bitch_please_by_odditude-d3hvw7l.jpg"
  , "http://img.myconfinedspace.com/wp-content/uploads/tdomf/19422/1196296456680.jpg"
  , "https://i.chzbgr.com/maxW500/3019206400/hF0B5DEF7/"
  , "http://www.betcheslovethis.com/files/uploads/wtb/bitch-please.jpg"
  , "http://fashionablethings.com/wp-content/uploads/2012/06/Bitch-please.jpg"

  ]

  bitchplease = (msg) ->
    msg.send msg.random images

  robot.hear /(\s|^)bitch(es)? please($|\W)/i, (msg) ->
    bitchplease msg
