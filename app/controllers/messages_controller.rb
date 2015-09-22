class MessagesController < ApplicationController
  require('byebug')

  def create
    message_body = params[:body]
    room_id = params[:room_id]
    room = Room.find(room_id)
    Message.create(body: message_body, room_id: room_id)
    respond_to do |format|
      format.js { render json: {success: true} }
      format.json { render json: {success: true, body: params[:body]} }
    end
    REDIS.publish(room.name, message_body)
  end
end
