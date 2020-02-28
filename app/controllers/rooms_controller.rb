class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @chats = Chat.all
  end

  def index
    @rooms = Room.all.order(:id)
  end
end
