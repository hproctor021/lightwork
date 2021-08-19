class Api::V1::UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show]

    before_action :authorized, only: [:auto_login]

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        user = User.find(params[:id])
        user.update(name: params[:user][:name], email: params[:user][:email], password: params[:user][:password], phone: params[:user][:phone], image: params[:user][:image] )
        render json: user
    end

    def get_user
        user = self.current_user
        render json: user
    end


    # REGISTER user instance created. If valid, payload object is created w/ user instance's 
    # id and passed into encode_token --> POST made to /users
    def create
        @user = User.create(user_params)
        if @user.valid?
            payload = {user_id: user.id}
            token = encode_token({payload)
            render json: {user: @user, token: token}
        else
            render json: {error: "Invalid email or password"}
        end
    end

    # LOGGING IN - POST made to /login
    # check for existing user with params passed, bcrypt compares
    # password given to user instance password
    def login
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            payload = {user_id: @user.id}
            token = encode_token(payload)
            render json: {user: @user, jwt: token, success: "Welcome back, #{@user.name}"}
        else
            render json: {error: "Invalid email or password"}
        end
    end


    # auto_login gets the variable @user from the logged_in method in 
    # the application controller, that runs after the authorized method
    def auto_login
        if session_user
            render json: user
        else
            render json: {error: "Not Logged In"}
        end
    end


    private

    def user_params
        params.permit(:email, :password)
    end

end
