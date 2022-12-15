class ReservationsController < ApplicationController
  
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      flash[:notice] = "ルームを予約しました"
      redirect_to  action: :show, id: @reservation.id
    else
      @post = Post.find(@reservation.post.id)  
      @reservation = Reservation.new
      flash[:notice] = "予約が失敗しました"
      render template: "posts/show"
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :person_num).merge(post_id: params[:post_id], user_id:current_user.id)
  end 

end