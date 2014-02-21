# Description:
#   Responds to hair
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

messages = [
  "http://www.onlyweirdpics.com/pictures/Weirdpictures-strange_Facial_Hair.jpg",
  "http://stuffistolefromtheinternet.com/wp-content/uploads/2012/08/crazy_facial_hair_02.jpg",
  "http://25.media.tumblr.com/tumblr_mekaugnu5W1rp5xj7o1_500.jpg",
  "http://stuffistolefromtheinternet.com/wp-content/uploads/2012/08/crazy_facial_hair_11.jpg",
  "http://tosh.comedycentral.com/blog/files/2013/06/BeardCozy.jpg",
  "http://cdn.images.express.co.uk/img/dynamic/80/590x/beard-390523.jpg",
  "http://media.tumblr.com/tumblr_m1ipd9BUzB1qzasvv.png",
  "http://artslab.shopfront.org.au/wp-content/uploads/2012/05/facial-hair-02.jpg",
  "http://media-cache-ak0.pinimg.com/236x/6c/45/4f/6c454fdf35a8666e116f0d6f8a8d8491.jpg",
  "http://1-ps.googleusercontent.com/x/www.trendhunter.com/cdn.trendhunterstatic.com/thumbs/xtentacle-mustache.jpeg.pagespeed.ic.k8Bi0fM9L6.jpg",
]

hair = (msg) ->
  pic = msg.random messages
  msg.send "Speaking of hair: #{pic}"


module.exports = (robot) ->
  robot.hear /(\s|^)hairs?($|\W)/i, (msg) ->
    hair msg
  robot.hear /(\s|^)beards?($|\W)/i, (msg) ->
    hair msg
  robot.hear /(\s|^)moustaches?($|\W)/i, (msg) ->
    hair msg
  robot.hear /(\s|^)mustaches?($|\W)/i, (msg) ->
    hair msg
  robot.hear /(\s|^)goatees?($|\W)/i, (msg) ->
    hair msg
  robot.hear /(\s|^)sideburns?($|\W)/i, (msg) ->
    hair msg