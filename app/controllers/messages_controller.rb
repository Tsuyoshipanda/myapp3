class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user_id = @current_user.id
    @message.post_id = @post.id
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:content )
  end
end
