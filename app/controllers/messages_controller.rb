class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    if message.valid?
      message.save
      render partial: "shared/message", locals: {message: message}
    else
      flash.now[:errors] = "Invalid message!"
    end
    rendered_message = MessageRenderer.new(message).render_partial
    REDIS.publish("rock", rendered_message)
  end

  private
  
  def message_params
    params.require(:message).permit(:user_id, :room_id, :body)
  end

end
