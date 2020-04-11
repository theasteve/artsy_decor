class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params

    @comment.user_id = current_user.id
    @comment.save
    redirect_to @commentable, notice: 'Comment Was Created'
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @question = @comment.commentable
    @comment.destroy!

    redirect_to question_path(@question)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
