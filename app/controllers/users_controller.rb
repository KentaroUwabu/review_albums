class UsersController < ApplicationController
  
  def show
    @user = User.find_by(id: params[:id])
    @reviews = @user.reviews.order(created_at: :desc)
  end
  
end
