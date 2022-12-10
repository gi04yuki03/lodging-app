class ReservationsController < ApplicationController
  def create
    if @reservation = current_user.reservations.create(reservation_params)
      start_date = Date.parse(reservation_params[:start_date])
      end_date = Date.parse(reservation_params[:end_date])
      days = (end_date - start_date).to_i + 1
  
      @reservation = current_user.reservations.build(reservation_params)
      @reservation.post = post
      @reservation.price = post.price
      @reservation.total = post.price * days * person_num
      @reservation.save
  
      flash[:notice] = "予約が完了しました。"
      redirect_to "/show"
    else
      render show_post_path
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  private

 def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :post_id)
  end 
  
end
