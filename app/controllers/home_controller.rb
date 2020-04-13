class HomeController < ApplicationController
  include UsersHelper

  def index
    @posts = Post.all
  end

  def show; end

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404
  end
end
