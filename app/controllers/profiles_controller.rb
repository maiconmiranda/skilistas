class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @profiles = Profile.all
  end


  def show
    @reviews = Review.where(profile_id: @profile.id).order("created_at DESC")
    @comments = Comment.where(profile_id: @profile.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:ratting).round(2)
    end
  end

  def new
    @profile = Profile.new
  end

  def edit
  end


  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
      if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
      else
      render :new
      end
  end


  def update
      if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
      else
      render :edit
      end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
    redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
    end
  end

  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:title, :description, :category_id, :user_id)
    end
end
