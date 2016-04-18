App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->   # Called when there's incoming data on the websocket for this channel
    $('#chats').append(data['message']);

  speak: (message, user_id, conversation_id) ->
    @perform 'speak', message: message, user_id: user_id, conversation_id: conversation_id
    
$(document).on 'keypress', '[data-behaviour~=room_speaker]', (event) ->
  if event.keyCode is 13
    jQuery ->
      text = $('#text').val()
      user_id = $('#user_id').val()
      conversation_id = $('#conversation_id').val()
      App.room.speak(text, user_id, conversation_id) 
      event.target.value = ''
      event.preventDefault()
