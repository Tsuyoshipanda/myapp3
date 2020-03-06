class PostsController < ApplicationController

  before_action :authenticate_user
  before_action :ensure_corrent_user, {only: [:edit, :update, :destroy]}

  require 'date'

  def index
    if params[:search_task_type] == nil && params[:search_free_word] == nil
      @posts = Post.all
    else
      @posts = Post.where('task_type_1=? OR task_type_2=? OR task_type_3=? OR task_type_4=? OR task_type_5=? OR task1 LIKE ? OR task2 LIKE ? OR task3 LIKE ? OR task4 LIKE ? OR task5 LIKE ?', params[:search_task_type], params[:search_task_type], params[:search_task_type], params[:search_task_type], params[:search_task_type], params[:search_free_word], params[:search_free_word], params[:search_free_word], params[:search_free_word], params[:search_free_word])
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
    @post = Post.new(params.require(:post).permit(:task1,:task2,:task3,:task4,:task5,:task_type_1,:task_type_2,:task_type_3,:task_type_4,:task_type_5,:"deadline_1(1i)",:"deadline_1(2i)",:"deadline_1(3i)",:"deadline_2(1i)",:"deadline_2(2i)",:"deadline_2(3i)",:"deadline_3(1i)",:"deadline_3(2i)",:"deadline_3(3i)",:"deadline_4(1i)",:"deadline_4(2i)",:"deadline_4(3i)",:"deadline_5(1i)",:"deadline_5(2i)",:"deadline_5(3i)"))
    @post.user_id = @current_user.id
    @post.save
    redirect_to("/posts/index")
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.task1 = params[:task1]
    @post.task2 = params[:task2]
    @post.task3 = params[:task3]
    @post.task4 = params[:task4]
    @post.task5 = params[:task5]
    @post.task_type = params[:task_type_1]
    @post.task_type = params[:task_type_2]
    @post.task_type = params[:task_type_3]
    @post.task_type = params[:task_type_4]
    @post.task_type = params[:task_type_5]
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
