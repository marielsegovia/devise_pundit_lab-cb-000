class UsersController < ApplicationController

    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
      authorize @user
    end

    def edit
    end

    def destroy
    end

end
