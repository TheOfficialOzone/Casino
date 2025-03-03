class ChatController < ApplicationController
  def send_message
      message = params[:input_string]
      puts "Received #{message}"
      puts "User: #{Current.session.user.id}"
      ActionCable.server.broadcast("chat_channel", {body: "#{Current.session.user.username}: #{message}"})
  end

  def receive
      puts "Receiving"
  end
end
