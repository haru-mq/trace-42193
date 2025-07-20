class CalculationsController < ApplicationController

  def create
    @calculation_signalinfo = CalculationSignalinfo.new(calculation_signalinfo_params)
    if @calculation_signalinfo.valid?
      @calculation_signalinfo.save
      redirect_to "/car/show/#{@calculation_signalinfo.car_id}"
    else
      redirect_to "/car/show/#{@calculation_signalinfo.car_id}", status: :unprocessable_entity
    end
  end

  private

  def calculation_signalinfo_params
    params.require(:calculation_signalinfo).permit(:calculation_name, :signal_name, :signal_type_id).merge(car_id: current_car_id)
  end
  
end
