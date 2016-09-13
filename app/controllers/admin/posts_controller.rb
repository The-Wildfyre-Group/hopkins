class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  expose :posts, ->{ Post.all }
  expose :post

  def index
    @posts = Post.all
  end

  def create
    if post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def update
    if post.update(post_params )
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    post.destroy
    redirect_to admin_posts_path
  end

  private

    def post_params
      params.require(:post).permit!
    end
end