class ParkingsController < ApplicationController
  # Step1:
  def new
    @parking = Parking.new
  end

  # Step2:
  def create
    @parking = Parking.new( :parking_type => "guest", :start_at => Time.now)
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
