url = require('url');
querystring = require('querystring');

module.exports = (robot) ->
  robot.router.get "/keepalive", (req, res) ->
    robot.send {target_jid: "85651_619559@chat.hipchat.com"}, "staying alive"
    res.end "PING"