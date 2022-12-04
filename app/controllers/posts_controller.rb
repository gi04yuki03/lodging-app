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
       redirect_to :posts
       else
       render "new"
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
  
  def search
    if params[:area] != nil && params[:keyword] != nil
      @posts = Post.where(params[:keyword]).where(params[:area])
    elsif params[:keyword] != nil
      @posts = Post.where(params[:keyword])
    elsif params[:area] != nil
      @posts = Post.where(address: params[:area])
    else
      @posts = Post.all
    end
  end
  
  
  private
  def post_params
    params.require(:post).permit(:name, :introduction, :price, :address, :image).merge(user_id:current_user.id)
  end
  
end