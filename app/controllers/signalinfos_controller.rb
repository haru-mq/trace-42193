class SignalinfosController < ApplicationController
  def create
    @signalinfo = Signalinfo.new(signalinfo_params)
    if @signalinfo.save
      redirect_to "/car/show/#{@signalinfo.calculation.car_id}"
    else
      redirect_to "/car/show/#{@signalinfo.calculation.car_id}", status: :unprocessable_entity
    end
  end

  private

  def signalinfo_params
    params.require(:signalinfo).permit(:signal_name, :signal_type_id, :calculation_id)
  end
    
end
