# Description:
#   Display a random "haters gonna hate" image
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

haters = [
  "http://jesad.com/img/life/haters-gonna-hate/haters-gonna-hate01.jpg"
, "http://i671.photobucket.com/albums/vv78/Sinsei55/HatersGonnaHatePanda.jpg"
, "http://24.media.tumblr.com/tumblr_lltwmdVpoL1qekprfo1_500.gif"
, "http://s3.amazonaws.com/kym-assets/photos/images/newsfeed/000/087/536/1292102239519.gif"
, "http://i391.photobucket.com/albums/oo351/PikaPow3/squirtle.gif"
, "http://c.static.memegenerator.net/cache/instances/500x/13/13355/13676320.jpg"
, "http://icanhasinternets.com/wp-content/uploads/2010/05/haters.gif"
, "http://icanhasinternets.com/wp-content/uploads/2010/05/haters5.jpg"
, "http://media.tumblr.com/tumblr_m2yv2hqw9l1rnvwt1.gif"
, "http://loldailyfun.com/wp-content/uploads/2012/02/Haters-Gonna-hate-Funny.jpg"
, "http://brian.io/slides/incog-intro/img/rollin.jpg"
, "http://static.fjcdn.com/pictures/Haters+Gonna+Hate_0dd058_3113024.jpg"
, "http://i616.photobucket.com/albums/tt249/xdudemanx/tumblr_l0qnfj71EW1qzh5gno1_500.jpg"
, "http://media.tumblr.com/tumblr_m0lrstSN3v1r3zat8.gif"
, "http://gifstumblr.com/images/haters-gonna-hate_1042.gif"
, "http://media.tumblr.com/tumblr_mcsjbg7oiS1rsw1yf.gif"
, "http://24.media.tumblr.com/tumblr_lvodq6DMWf1qh0381o1_500.jpg"
, "http://gifstumblr.com/images/haters-gonna-hate_917.gif"
, "http://24.media.tumblr.com/tumblr_m2c0dq6LZM1rqfhi2o1_500.gif"
, "http://images3.wikia.nocookie.net/__cb20121028024917/adventuretimewithfinnandjake/images/f/f5/FP_haters_gonna_hate_tumblr.jpg"
, "http://4.media.bustedtees.cvcdn.com/c/-/bustedtees.144ff9bc-01d6-4301-8df6-ca61ceb8.gif"
, "http://media.tumblr.com/tumblr_m7cd97esq21qalpyw.png"
]

hatin = (msg) ->
  msg.send msg.random haters

module.exports = (robot) ->
  robot.hear /(\s|^)hat(e|er|ers|in)($|\W)/i, (msg) ->
    hatin msg
