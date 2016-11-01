class UsersController < ApplicationController
  before_action :find_users, only: [:edit, :show, :update, :destroy]

  def index
    @users = User.all
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(users_params)
    if @users.save
      auto_login(@users)
      redirect_to root_url, notice: "Signed up!"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @users.update(users_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @users.destroy
    redirect_to root_path
  end

  private

  def users_params
    params.require(:user).permit(:email, :password)
  end

  def find_users
    @users = User.find(current_user.id)
  end
  end
