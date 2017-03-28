class ParkingsController < ApplicationController
  # Step1:
  def new
    @parking = Parking.new
  end

  # Step2:
  def create
    @parking = Parking.new(:start_at => Time.now)
    if current_user
      @parking.parking_type = params[:parking][:parking_type]
      @parking.user = current_user
    else
      @parking.parking_type = "guest"
    end
    @parking.save!

    redirect_to parking_path(@parking)
  end

  # step3
  # step5
  def show
    @parking = Parking.find(params[:id])
  end

  # step4
  def update
    @parking = Parking.find(params[:id])
    @parking.end_at = Time.now
    @parking.calculate_amount

    @parking.save!

    redirect_to parking_path(@parking)
  end



end
