class UsersController < ApplicationController
  def index
    @users = User.all
    # render json: @users

    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    # render json: @user

    render :show
  end

  def new
    @user = User.new
    # For future re-render and autofill purposes

    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # debugger
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages, status: 422
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :age)
  end

  def edit
    @user = User.find(params[:id])

    render :edit
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages, status: 422
    end
  end
end