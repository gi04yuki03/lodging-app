class PostsController < ApplicationController
  
  def index
  @posts = Post.all
  end
  
  def new
    @post = Post.new  
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "ルームを新規登録しました"
       redirect_to "/show"
       else
       render "/new"
      end
  end
  
  def show
   @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      flash[:notice] = "ルームの情報を更新しました"
      redirect_to post_path(post.id)
    else
      render "/edit"
    end
  end
  
  
  private
  def post_params
    params.require(:post).permit(:name, :introduction, :price, :address, :image)
  end
  
end