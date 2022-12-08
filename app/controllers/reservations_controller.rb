class ReservationsController < ApplicationController
  def create
    if @reservation = current_user.reservations.create(reservation_params)
      redirect_to "show"
    else
      render show_post_path
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  private

 def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :book_id)
  end 
  
end
