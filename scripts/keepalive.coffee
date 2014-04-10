url = require('url');
querystring = require('querystring');

module.exports = (robot) ->
  robot.router.get "/keepalive", (req, res) ->
    robot.send {jid: "85651_bot_test@conf.hipchat.com"}, "staying alive"
    res.end "PING"