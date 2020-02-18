import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    return $('#chat-index').append('<li>' + data.message + '<li>');
  },

  post: function() {
    return this.perform('post', {message: message});
  }
}, $(document).on('keypress', '[data-behavior~=chat_post]', function(event){
  if(event.keyCode === 13){
    var chatForm = $('#chat_form');
    App.chat.post(chatForm.val());
    return //chatForm.val('');
  }
}));
