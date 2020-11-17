class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

 
  def index
    @profiles = Profile.all
  end


  def show
  end

  def new
    @profile = Profile.new
  end

  def edit
  end


  def create
    @profile = Profile.new(profile_params)
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.'}
      else
        format.html { render :new }
      end
  end


  def update
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
      else
        format.html { render :edit }
      end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.'}
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
