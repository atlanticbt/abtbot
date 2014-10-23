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
  getHuddleNow = (msg) ->
    now = new Date
    roomId = msg.message.room
    try
      if (!roomNotes[roomId] || !roomNotes[roomId].lastDay || (roomNotes[roomId].lastDay.getDate() != now.getDate() || roomNotes[roomId].lastDay.getMonth() != now.getMonth() || roomNotes[roomId].lastDay.getYear() != now.getYear()))
        roomNotes[roomId] = {lastDay: now, notes: []}
    catch e
      console.log e
    roomNotes[roomId].notes
  robot.respond /huddle me/i, (msg) ->
    # respond to person directly
    notes = getHuddleNow(msg)
    huddle = if notes.length then "Huddle Notes\n---\n#{notes.join("\n")}" else "No huddle notes have been logged in that room for today"
    robot.send {jid: msg.message.user.jid}, huddle
  robot.hear /(^|.*?\s)\#huddle($|\W(.+))/i, (msg) ->
    notes = getHuddleNow(msg)
    notes.push "#{msg.message.user.name}: #{msg.match[1]}\#huddle#{msg.match[2]}"
