class ReviewsController < ApplicationController
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(
      letter: params[:letter],
      rate: params[:rate],
      album_id: session[:album_id],
      user_id: current_user.id
    )
    if @review.save
      redirect_to("/")
    else
      render("reviews/new")
    end
  end
  
end
