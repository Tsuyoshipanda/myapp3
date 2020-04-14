class ShowController < ApplicationController
  def show
    @message = Message.all
  end
end
