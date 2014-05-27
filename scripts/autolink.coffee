# Description:
#   Linkify Portal and Redmine tickets
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   p#____ for portal tickets
#   rm#____ for redmine tickets
#
# Author:
#   jfoushee

module.exports = (robot) ->
  portalmsg = (id, msg) ->
    msg.send "http://portal/ticket.asp?id=#{id}";
  redminemsg = (id, msg) ->
    msg.send "https://redmine02.atlanticbt.com/issues/#{id}";

  robot.hear /(\W|^)rm\#(\d+)($|\W)/i, (msg) ->
    redminemsg msg.match[2], msg
  robot.hear /(\W|^)redmine issue \#?(\d+)($|\W)/i, (msg) ->
    redminemsg msg.match[2], msg
  robot.hear /(\W|^)p\#(\d+)($|\W)/i, (msg) ->
    portalmsg msg.match[2], msg
  robot.hear /(\W|^)portal ticket \#?(\d+)($|\W)/i, (msg) ->
    portalmsg msg.match[2], msg
