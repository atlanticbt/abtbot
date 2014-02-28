# Description:
#   Hubot responds to hang on
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hang on - has hubot play music
#
# Author:
#   jfoushee


oneMoment = (msg) ->
  msg.send "/me plays Jeopardy music quietly"

module.exports = (robot) ->
  robot.hear /(\s|^)(hang|hold) on($|\W)/i, (msg) ->
    oneMoment msg
  robot.hear /(\s|^)(give me|gimme) (a|1|one) (sec|moment|second)($|\W)/i, (msg) ->
    oneMoment msg
  robot.hear /^(1|one) (sec|moment|second)($|\W)/i, (msg) ->
    oneMoment msg