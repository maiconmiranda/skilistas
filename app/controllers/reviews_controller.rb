class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update]
  before_action :set_profile
  before_action :authenticate_user!, except: [:index, :show]
  

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.profile_id = @profile.id

   
    if @review.save
      redirect_to @profile
    else
      render 'new'
    end
  end


  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @profile, notice: 'Review was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
      @profile.reviews.destroy
     redirect_to @profile
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def set_profile
      @profile = Profile.find(params[:profile_id])
    end

    def review_params
      params.require(:review).permit(:ratting, :user_id, :profile_id)
    end
end
