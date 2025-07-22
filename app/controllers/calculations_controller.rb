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

  def edit
    @car = Car.find(params[:car_id])
    @calculation = Calculation.find(params[:id])
  end

  def update
    @calculation = Calculation.find(params[:id])
    if @calculation.update(calculation_params)
      redirect_to car_path(@calculation.car)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def trace_signals
    @calculation = Calculation.find(params[:id])
    @trace_signals = SignalTraceService.new(@calculation.id).call
  end

  private

  def calculation_signalinfo_params
    params.require(:calculation_signalinfo).permit(:calculation_name, :signal_name, :signal_type_id).merge(car_id: current_car_id)
  end

  def calculation_params
    params.require(:calculation).permit(:calculation_name).merge(car_id: params[:car_id])
  end
  
end
