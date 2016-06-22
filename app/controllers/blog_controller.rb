class BlogController < ApplicationController
  def index
    @posts = Post.all.order("id desc")
  end
  def show
    @post = Post.find_by id: params[:id]
  end

  def new
    @blogpost = Post.new
  end

  def create
    @blogpost = Post.new
    @blogpost.title = params[:post][:title]
    @blogpost.author = params[:post][:author]
    @blogpost.body = params[:post][:body]
    if @blogpost.save
      redirect_to root_path
    else
      render :new
    end
  end
  def edit
    @blogpost = Post.find_by id: params[:id]
  end
  def update
  updated_post = Post.find_by id: params[:id]
  updated_post.title = params[:post][:title]
  updated_post.author = params[:post][:author]
  updated_post.body = params[:post][:body]
  updated_post.save
  redirect_to show_post_path(id: params[:id])


  end

end
