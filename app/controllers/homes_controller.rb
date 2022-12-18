class HomesController < ApplicationController
  def top
    @posts = @posts.where('address LIKE ?', "%#{params[:search]}%") if params[:search].present? 
  end
end
