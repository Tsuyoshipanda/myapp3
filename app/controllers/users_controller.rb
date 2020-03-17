class UsersController < ApplicationController

  before_action :authenticate_user, {only: [:edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_corrent_user, {only: [:edit, :update]}


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params_create)
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました！"
      session[:user_id] = @user.id
      redirect_to("/about")
    else
      render("users/new")
    end

  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email], password: params[:password])

    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/posts/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]

      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  def show
    @user = User.find_by(id: params[:id])
    @bookmark_posts = @user.bookmark_posts
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params_update)
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end

  def ensure_corrent_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end


  private
    def user_params_create
      params.require(:user).permit(:name, :email, :password, :avatar)
    end

    def user_params_update
      params.require(:user).permit(:name, :email, :avatar)
    end



end
