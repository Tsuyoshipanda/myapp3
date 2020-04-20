class ShowController < ApplicationController
  def show
    @message = Message.all
  end

  def create
    @message = @group.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to "post_path(params[:group_id])" }
        format.json
      end
    else
           //
    end
  end
end
