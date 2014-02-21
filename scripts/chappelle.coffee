# Description:
#   Chappelle show throwback
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot chappelle me - posts a random chappelle show image
#   hubot chappelle bomb <#> - posts <#> chappelle show images
#
# Author:
#   johnf

chappelle = [
  "http://i214.photobucket.com/albums/cc45/snesfreak/cs-wkirgwveron.gif",
  "http://i132.photobucket.com/albums/q40/walunasc/DaveChappelle-LilJohn.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/what.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/rj-fuckyocouch.gif",
  "http://i2.photobucket.com/albums/y3/DragonMyst103/Dylanconfuse.gif",
  "http://i2.photobucket.com/albums/y3/DragonMyst103/diddyout.gif",
  "http://i2.photobucket.com/albums/y3/DragonMyst103/byahgoflarge.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/robot1.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/robot2.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/robot3.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/cs-debtgambling.gif",
  "http://i439.photobucket.com/albums/qq113/phil_mcloser/gif/charliemurphy.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/cs-tyronefcg.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/cs-clayton2.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/cs-chadsdad.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/redballs2.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/waynebrady2.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/charliemurphy.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/rj.gif",
  "http://i214.photobucket.com/albums/cc45/snesfreak/unity.gif",
  "http://www.pocketberry.com/wp-content/uploads/2009/07/screenshot_15.gif"
]

chappelleMessage = (msg) ->
  msg.send msg.random chappelle


module.exports = (robot) ->
  robot.respond /chappelle me(.*)/i, (msg) ->
    chappelleMessage msg
  robot.respond /chappelle bomb(\s*(\d+))?/i, (msg) ->
    count = msg.match[2] || 5
    chappelleMessage msg for i in [count..1]
