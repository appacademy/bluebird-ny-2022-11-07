class SessionsController < ApplicationController

    before_action :require_logged_out, only: [:new, :create]
    before_action :require_logged_in, only: [:destroy]

    def new
        @user = User.new
        render :new
    end

    def create
        username = params[:user][:username]
        password = params[:user][:password]
        @user = User.find_by_credentials(username, password)

        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            @user = User.new(
                username: params[:user][:username],
                password: params[:user][:password]
            )
            flash.now[:errors] = ["Invalid Credentials. Please try again..."]
            render :new
        end
    end

    def destroy
        if logged_in?
            logout!
        end

        flash[:messages] = ["Successfully logged out!"]

        redirect_to new_session_url
    end

end