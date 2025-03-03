import consumer from "channels/consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected ChatChannel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected ChatChannel");
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Received ChatChannel");
    const messages = document.getElementById('messages');
    const message  = document.createElement('p');
    message.innerHTML = data["body"];
    // messages.appendChild(message);
    messages.insertBefore(message, messages.firstChild);
  }
});
