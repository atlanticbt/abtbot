# Description:
#   Pulls a random programmer Ryan Gosling image
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_TUMBLR_API_KEY
#
# Commands:
#   hubot gos(ling)? me - Receive a programmer Ryan Gosling meme
#   hubot gos(ling)? bomb N - Receive N programmer Ryan Gosling memes
#
# Author:
#   jessedearing

api_key = process.env.HUBOT_TUMBLR_API_KEY

getRandomGoslingImageUrl = (msg, rand) ->
  msg.http("http://api.tumblr.com/v2/blog/programmerryangosling.tumblr.com/posts?api_key=#{api_key}&offset=#{rand}&limit=1").get() (err, res, body) ->
    if err
      msg.send "Tumblr said #{err}"
    else
      try
        post = JSON.parse(body)
        msg.send(post.response.posts[0].photos[0].original_size.url)
      catch error
        msg.send error

getGoslingImage = (msg) ->
  msg.http("http://api.tumblr.com/v2/blog/programmerryangosling.tumblr.com/info?api_key=#{api_key}").get() (err, res, body) ->
    if err
      msg.send "Tumblr said #{err}"
    else
      try
        total_posts = JSON.parse(body).response.blog.posts
        rand = Math.floor(Math.random() * total_posts)
        getRandomGoslingImageUrl(msg, rand)
      catch error
        msg.send error

module.exports = (robot) ->
  robot.respond /gos(ling)? me/i, (msg) ->
    getGoslingImage(msg)

  robot.respond /gos(ling)? bomb (\d+)/i, (msg) ->
    count = msg.match[2] || 5
    for num in [count..1]
      getGoslingImage(msg)
