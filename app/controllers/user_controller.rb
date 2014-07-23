class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def create
    # Using params[:user] without calling user_params will throw an error because 
    # the parameters were not filtered. This is just some Rails magic.
    @user = User.new user_params
    if @user.save
      # Do whatever
    else
      render action: :new
    end
  end

  private

  def user_params
    # params.require(:user) throws an error if params[:user] is nil
      params.require(:user).permit :first_name, :last_name, :user_name, :email, :password, :password_confirmation
  end
end