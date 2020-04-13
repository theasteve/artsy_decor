# frozen_string_literal: true

# Controller for Posts
class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  include UsersHelper


  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.create(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(
      :user_id,
      :title,
      :location,
      :description,
      :image
    )
  end
end
