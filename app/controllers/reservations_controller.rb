class ReservationsController < ApplicationController
  
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to  action: :show, id: @reservation.id
    else
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