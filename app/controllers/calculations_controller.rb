class CalculationsController < ApplicationController

  def create
    calculation = Calculation.create(calculation_params)
    redirect_to "/car/show/#{calculation.car_id}"
  end


  private

  def calculation_params
    params.require(:calculation).permit(:calculation_name).merge(car_id: params[:car_id])
  end
  
end
