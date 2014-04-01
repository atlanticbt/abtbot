# Description:
#   Display a random "[intensify]" image
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   intensify/intensifies - displays a rimshot image
#
# Author:
#   jfoushee

module.exports = (robot) ->
  intensifies = [
    "http://i1.kym-cdn.com/photos/images/original/000/612/917/02d.gif", #doge (wow)
    "http://www.vgmemes.com/wp-content/uploads/2013/09/potassium-intensifies.gif", # potassium
    "http://i3.kym-cdn.com/photos/images/original/000/721/529/ee5.gif", # joy
    "https://warosu.org/data/jp/img/0111/56/1373350526175.jpg", #drive
    "http://i0.kym-cdn.com/photos/images/original/000/612/714/c50.gif", #shrek
    "http://i3.kym-cdn.com/photos/images/original/000/612/718/2c5.gif", #scrunch
    "http://awesomegifs.com/wp-content/uploads/timey-wimey-intensifies.gif", #tardis
    "http://i1.kym-cdn.com/photos/images/original/000/612/922/df8.gif", #thanks
    "http://i2.kym-cdn.com/photos/images/original/000/612/868/fa8.gif", #the dick
    "http://i1.kym-cdn.com/photos/images/original/000/613/051/66c.gif", #parenting
    "http://i0.kym-cdn.com/photos/images/original/000/612/862/627.gif", #shaking
    "http://i2.kym-cdn.com/photos/images/original/000/673/449/236.gif", #nope
    "http://media.giphy.com/media/bSB973nH5Dt2o/giphy.gif", #netflix
    "http://i2.kym-cdn.com/photos/images/newsfeed/000/659/143/1d7.gif", #staring
    "http://i3.kym-cdn.com/photos/images/original/000/632/577/774.gif", #readiness
    "http://99gifs.com/-img/525de5991605fb2817000001.gif?w=400&h=273" #meowing
  ]

  robot.hear /(\W|^)intensif(y|ies)($|\W)/i, (msg) ->
    msg.send msg.random intensifies
