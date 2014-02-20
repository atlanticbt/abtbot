# Description
#   Allows user to submit haikus
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @abtbot haiku me - Return a random haiku
#   @abtbot haiku write - starts listening for you to write a haiku.
#
# Notes:
#   None
#
# Author:
#   fousheezy


#
# Object of room ids => object of user ids => {listener: <obj>, lines: <array of lines>}
#
# e.g. {
#   roomId: {
#     userId: ["Line", "Line", "Line"]
#     userId: ["Line","Line"]
#   }
# }
#
#



module.exports = (robot) ->
  # map of who is writing a haiku in which room
  haikus = {}

  removeListener = (listener) ->
    if (!listener)
      console.log "listener wasn't anything", listener
      return

    listenerIndex = -1
    for list, i in robot.listeners
      if list is listener
        listenerIndex = i
        break
    console.log "Listner index: #{listenerIndex}"
    if (listenerIndex >= 0)
      setTimeout ->
        console.log "Spliced"
        robot.listeners.splice(listenerIndex, 1)
      , 0
    listener = null

  startHaiku = (msg) ->
    roomId = msg.message.user.room
    userId = msg.message.user.id
    haikus[roomId] ?= {};
    haikus[roomId][userId] ?=
      listener: null,
      lines: []
    if haikus[roomId][userId].listener
      msg.send "I am already recording a haiku"
      return
    console.log "recording in",haikus[roomId][userId]
    listenersCount = robot.hear /.*/, (caughtMsg) ->
      caughtRoomId = caughtMsg.message.user.room
      caughtUserId = caughtMsg.message.user.id
      unless haikus[caughtRoomId][caughtUserId].lines
        return
      # record the message if under three lines
      if haikus[caughtRoomId][caughtUserId].lines.length < 3
        haikus[caughtRoomId][caughtUserId].lines.push caughtMsg.message.text
      if haikus[caughtRoomId][caughtUserId].lines.length > 2
        haiku = haikus[caughtRoomId][caughtUserId].lines.join '\n'
        caughtMsg.send "Shall I save your haiku: \n#{haiku}\nType '@#{robot.name} haiku save' to save\nType '@#{robot.name} haiku erase' to erase";
      return
    msg.send "The next 3 lines you write to me in this room will be turned into a haiku"
    haikus[roomId][userId].listener = robot.listeners[listenersCount - 1]

  saveHaiku = (msg) ->
    caughtRoomId = msg.message.user.room
    caughtUserId = msg.message.user.id
    unless haikus[caughtRoomId][caughtUserId].lines
      return
    # save to brain
    robot.brain.data.haikus ?= []
    robot.brain.data.haikus.push
      user: msg.message.user.id
      time: new Date().getTime()
      msg: haikus[caughtRoomId][caughtUserId].lines.join('\n')
    clearHaiku msg
  clearHaiku = (msg) ->
    console.log 'clearing haiku'
    caughtRoomId = msg.message.user.room
    caughtUserId = msg.message.user.id
    unless haikus[caughtRoomId][caughtUserId]
      console.log "nothing set for #{caughtRoomId}, #{caughtUserId}", haikus, haikus[caughtRoomId][caughtUserId]
      return

    # clear out contents
    removeListener haikus[caughtRoomId][caughtUserId].listener
    haikus[caughtRoomId][caughtUserId] = null

  robot.respond /haiku me(\s*)?$/i, (msg) ->
    haiku = msg.random robot.brain.data.haikus
    msg.send haiku.msg
  robot.respond /haiku write(.*)?/i, (msg) ->
    startHaiku msg
  robot.respond /haiku save/i, (msg) ->
    saveHaiku msg
    msg.send "I'll remember that as a Haiku from now on"
  robot.respond /haiku erase/i, (msg) ->
    clearHaiku msg
    msg.send "I've forgotten your haiku"
