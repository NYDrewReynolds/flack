class MessagesController < ApplicationController
  require('byebug')

  def create
    message_body = params[:body]
    room_id = params[:room_id]
    room = Room.find(room_id)
    user_id = params[:user_id]
    screen_name = User.find(user_id).screen_name
    Message.create(body: message_body, room_id: room_id, user_id: user_id)
    respond_to do |format|
      format.js { render json: {success: true} }
      format.json { render json: {success: true, body: params[:body], screen_name: screen_name} }
    end
    REDIS.publish("flack:#{room.name}", message_body)
  end
end
