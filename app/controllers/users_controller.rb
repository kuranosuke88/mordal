class UsersController < ApplicationController
  before_action :set_user, only: %i(show edit_basic_info update_basic_info)
  
  def index
    @users = User.all
    @user = User.find_by(params[:id])
  end
  
  def show
  end
  
  def edit_basic_info
  end
  
  private
   
   def set_user
     @user = User.find(params[:id])
   end
end