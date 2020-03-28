class UsersController < ApplicationController
  before_action :set_user, only: %i(show)
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  
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

   def user_params
     params.require(:user).permit(:guardian, :student, :email, :birthday, :school, :school_year, :zoom, :real, :fix_day, :fix_time, :password, :password_confirmation)
   end
  
   # beforeフィルター

   # ログイン済みのユーザーか確認します。
   def logged_in_user
     unless logged_in?
       store_location
       flash[:danger] = "ログインしてください。"
       redirect_to login_url
     end
   end
  
   # アクセスしたユーザーが現在ログインしているユーザーか確認します。
   def correct_user
     redirect_to(root_url) unless current_user?(@user)
   end
end