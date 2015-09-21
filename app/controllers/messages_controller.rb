class MessagesController < ApplicationController
  require('byebug')

  def create
    respond_to do |format|
      format.js { render json: {success: true} }
      format.json { render json: {success: true, body: params[:body]} }
    end
  end
end
