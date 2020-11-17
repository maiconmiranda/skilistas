class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update]
  before_action :set_profile
  before_action :authenticate_user!, except: [:index, :show]
  

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.profile_id = @profile.id

   
    if @comment.save
      redirect_to @profile
    else
      render 'new'
    end
  end


  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @profile, notice: 'comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
        @profile = @profile.comments.destroy
     redirect_to @profile
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_profile
      @profile = Profile.find(params[:profile_id])
    end

    def comment_params
      params.require(:comment).permit(:description, :user_id, :profile_id)
    end
end
