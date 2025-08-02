class CalculationsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_calculation, only: [:update, :destroy, :trace_signals]

  def create
    @calculation = Calculation.new(calculation_params)
    if @calculation.save
      redirect_to car_path(@calculation.car_id)
    else
      @car = Car.find(params[:car_id])
      @calculations = @car.calculations.includes(:car)
      @signalinfo = Signalinfo.new
      flash[:errors_calculation_create] = @calculation.errors.full_messages
      flash[:input_calculation_create] = params[:calculation]
      handle_calculation_error
    end
  end

  def update
    if @calculation.update(calculation_params)
      redirect_to car_path(@calculation.car_id)
    else
      flash[:errors_calculation_update] = @calculation.errors.full_messages
      flash[:input_calculation_update] = params[:calculation]
      flash[:calculation_error_id] = {
        car_id: @calculation.car_id,
        calculation_id: @calculation.id
      }
      handle_calculation_error
    end
  end

  def destroy
    @calculation.destroy
    redirect_to car_path(@calculation.car_id)
  end

  def trace_signals
    result = SignalTraceService.new(@calculation.id).call
    @trace_signals = result[:results]
    @loop_limit_exceeded = result[:loop_limit_exceeded]
  end

  private

  def set_calculation
    @calculation = Calculation.find(params[:id])
  end

  def calculation_params
    params.require(:calculation).permit(:calculation_name).merge(car_id: params[:car_id])
  end

  def handle_calculation_error
    @car = Car.find(params[:car_id])
    @calculations = @car.calculations.includes(:car)
    @signalinfo = Signalinfo.new
    redirect_to car_path(@car)
  end
end
