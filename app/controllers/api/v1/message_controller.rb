class Api::V1::MessageController < ApplicationController
  def add_message


    respond_to do |format|
      format.js { render json: {success: true} }
      format.json { render json: {success: true} }
    end
  end
end
