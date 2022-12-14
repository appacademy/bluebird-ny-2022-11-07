class UsersController < ApplicationController

  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:index, :show, :edit, :update]

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
      login(@user)
      redirect_to user_url(@user)
    else
      # render json: @user.errors.full_messages, status: 422
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def user_params
    # debugger
    params.require(:user).permit(:username, :email, :password, :age, :political_affiliation)
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