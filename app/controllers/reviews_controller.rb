class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(
      title: params[:title],
      letter: params[:letter],
      rate: params[:rate],
      user_id: current_user.id
    )
  end
  
end
