class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    if message.valid?
      message.save
      render partial: "shared/message", locals: {message: message}
    else
      flash.now[:errors] = "Invalid message!"
    end
    REDIS.publish("rock", message.body.to_json)
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :room_id, :body)
  end

end
