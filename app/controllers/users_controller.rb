class UsersController < ApplicationController
  def show
    @user = params[:id] ? User.find(params[:id]) : current_user
    @destinations = @user.destinations
  end
  
end
