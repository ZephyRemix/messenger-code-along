class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    # Rails.logger.info("Received data in message channel: #{data}")
    data["user"] = current_user
    # Rails.logger.info("After adding current user into data: #{data}")
    ActionCable.server.broadcast("message", data)
  end
end
