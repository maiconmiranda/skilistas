class PagesController < ApplicationController
  skip_before_action :authenticate_user!, raise: false

  def home
    @profiles = Profile.all
    @categories = Category.all
  end

end
