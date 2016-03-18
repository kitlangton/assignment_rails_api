class ReviewsController < ApplicationController

  def index
    @reviews = Review.all.order(review_date: :desc).page params[:page]
    @review = Review.new

    respond_to do |format|
      format.html
      format.json { render json: @reviews }
      format.js
    end
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      respond_to do |format|
        format.html { redirect_to reviews_url }
        format.js
      end
    else
      render :index
    end
  end

  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.json { render json: @review }
      format.html
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      respond_to do |format|
        format.html { redirect_to request.referer }
        format.js
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:reviewer_name, :title, :review_text, :movie_id)
  end

end
