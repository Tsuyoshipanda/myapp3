class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    binding.pry
    @chats = Chat.all
  end

  def index
    @rooms = Room.all.order(:id)
  end
end
