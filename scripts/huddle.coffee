# Description:
#   Remembers daily huddle notes
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   #huddle X
#   Hubot huddle me
#
# Author:
#   johnf

module.exports = (robot) ->
  roomNotes = {}
  lastHuddleDay = null;
  getHuddleNow = (msg) ->
    now = new Date
    roomId = msg.message.room
    try
      if (lastHuddleDay == null || (lastHuddleDay.getDate() != now.getDate() || lastHuddleDay.getMonth() != now.getMonth() || lastHuddleDay.getYear() != now.getYear()))
        lastHuddleDay = now
        roomNotes[roomId] = []
    catch e
      console.log e
    roomNotes[roomId]
  robot.respond /huddle me/i, (msg) ->
    # respond to person directly
    notes = getHuddleNow(msg)
    console.log msg.message.user
    huddle = if notes.length then "Huddle Notes\n---\n#{notes.join("\n")}" else "No huddle notes have been logged in that room for today"
    robot.send {jid: msg.message.user.jid}, huddle
  robot.hear /(^|.*?\s)\#huddle($|\W(.+))/i, (msg) ->
    notes = getHuddleNow(msg)
    notes.push "#{msg.message.user.name}: #{msg.match[1]}\#huddle#{msg.match[2]}"
