class CalculationsController < ApplicationController

  def create
    @calculation = Calculation.new(calculation_params)
    if @calculation.valid?
      @calculation.save
      redirect_to car_path(@calculation.car_id)
    else
      redirect_to car_path(@calculation.car_id), status: :unprocessable_entity
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

  def destroy
    @calculation = Calculation.find(params[:id])
    @calculation.destroy
    redirect_to car_path(@calculation.car_id)
  end

  def trace_signals
    @calculation = Calculation.find(params[:id])
    @trace_signals = SignalTraceService.new(@calculation.id).call
  end

  private

  def calculation_params
    params.require(:calculation).permit(:calculation_name).merge(car_id: params[:car_id])
  end
  
end
