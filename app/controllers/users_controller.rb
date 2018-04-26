class UsersController < ApplicationController
  before_action :set_username, only: [:show, :edit, :update, :destroy]
  
  def index
    @users =User.all
  end

  def show
  end

  private
      # Use callbacks to share common setup or constraints between actions.

    def set_username
      @user = User.find_by(username: params[:username])
    end
end
