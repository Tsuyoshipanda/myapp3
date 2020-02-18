class PostsController < ApplicationController

  before_action :authenticate_user
  before_action :ensure_corrent_user, {only: [:edit, :update, :destroy]}

  def index
    if params[:search_task_type] == nil && params[:search_free_word] == nil
      @posts = Post.all
    else
      @posts = Post.where('task_type=? OR task1 LIKE ? OR task2 LIKE ? OR task3 LIKE ? OR task4 LIKE ? OR task5 LIKE ?', params[:search_task_type], params[:search_free_word], params[:search_free_word], params[:search_free_word], params[:search_free_word], params[:search_free_word])
    end

  end

  def type
  end


  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params.require(:post).permit(:task1,:task2,:task3,:task4,:task5,:task_type))
    @post.user_id = @current_user.id
    @post.save
    redirect_to("/posts/index")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.save

    redirect_to("/posts/index")
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy

    redirect_to("/posts/index")
  end

  def ensure_corrent_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

  def search
    if params[:search_task_type].blank?
      params[:search_task_type] = nil
    end

    if params[:search_free_word].blank?
      params[:search_free_word] = nil
    end
    redirect_to posts_index_path(search_task_type: params[:search_task_type], search_free_word: params[:search_free_word])
  end

end
