class ApplicationController < ActionController::Base
  before_action :authenticate_user!,except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  def after_sign_in_path_for(resource)
    posts_path
  end
  
  def set_search
     if params[:area] != nil && params[:keyword] != nil
      @posts = Post.where('price LIKE ? or name LIKE ? or introduction LIKE ? or address LIKE ?',"%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%", "%#{params[:keyword]}%").where('address LIKE(?)', "%#{params[:area]}%")
    elsif params[:keyword] != nil
      @posts = Post.where('price LIKE ? or name LIKE ? or introduction LIKE ? or address LIKE ?',"%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%", "%#{params[:keyword]}%")
    elsif params[:area] != nil
      @posts = Post.where('address LIKE ?', "%#{params[:area]}%")
    else
      @posts = Post.all
    end
  end
  
end
