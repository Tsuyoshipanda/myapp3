class WorksController < ApplicationController
  before_action :set_post

  def create
    @work = Work.create(user_id: current_user.id, post_id: params[:post_id])
    @works = Work.where(post_id: params[:post_id])
    @post.reload
  end

  def destroy
    work = Work.find_by(user_id: current_user.id, post_id: params[:post_id])
    work.destroy
    @works = Work.where(post_id: params[:post_id])
    @post.reload
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
