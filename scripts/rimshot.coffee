# Description:
#   Display a random "rimshot" image
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   rimshot - displays a rimshot image
#
# Author:
#   jfoushee

module.exports = (robot) ->
  rimshots = [
    "http://fireden.net/4chan/images.4chan.org//vg/src/1369179380371.gif",
    "http://www.greatplainsexaminer.com/wp-content/uploads/2012/05/rimshot-gary.gif",
    "http://images.sodahead.com/profiles/0/0/2/4/1/7/1/2/3/rimshot-83965485661.jpeg",
    "http://denver.mylittlefacewhen.com/media/f/img/mlfw2223-ba_dum_tis.gif",
    "http://fc00.deviantart.net/fs70/f/2013/273/1/f/bruce_rimshot_by_mrrextv1-d6ooemj.gif",
    "http://www.lowbird.com/data/images/2010/05/rimshot.png"
  ]

  robot.hear /(\W|^)rimshot($|\W)/i, (msg) ->
    msg.send msg.random rimshots
