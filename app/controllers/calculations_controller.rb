class CalculationsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_calculation, only: [:edit, :update, :destroy, :trace_signals]


  def create
    @calculation = Calculation.new(calculation_params)
    if @calculation.save
      redirect_to car_path(@calculation.car_id)
    else
      @car = Car.find(params[:car_id])
      @calculations = @car.calculations.includes(:car)
      @signalinfo = Signalinfo.new
      flash[:errors] = @calculation.errors.full_messages
      flash[:input] = params[:calculation]
      redirect_to car_path(@car)
    end
  end

  def edit
    @car = Car.find(params[:car_id])
  end

  def update
    if @calculation.update(calculation_params)
      redirect_to car_path(@calculation.car)
    else
      render :edit, status: :unprocessable_entity
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
  
end
