class SignalinfosController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
  before_action :set_signalinfo, only: [:edit, :update, :destroy]

  def create
    @signalinfo = Signalinfo.new(signalinfo_params)
    if @signalinfo.save
      redirect_to car_path(@signalinfo.calculation.car_id)
    else
      @car = Car.find(params[:car_id])
      @calculation = Calculation.new(car_id: @car.id)
      @calculations = @car.calculations.includes(:car)
      flash[:errors_signalinfo] = @signalinfo.errors.full_messages
      flash[:input_signalinfo] = params[:signalinfo]
      redirect_to car_path(@car)
    end
  end

  def edit
    @car = Car.find(params[:car_id])
    @calculation = Calculation.find(params[:calculation_id])
  end

  def update
    if @signalinfo.update(signalinfo_params)
      redirect_to car_path(@signalinfo.calculation.car_id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @signalinfo.destroy
    redirect_to car_path(@signalinfo.calculation.car_id)
  end

  private

  def set_signalinfo
    @signalinfo = Signalinfo.find(params[:id])
  end

  def signalinfo_params
    params.require(:signalinfo).permit(:signal_name, :signal_type_id).merge(calculation_id: params[:calculation_id])
  end
    
end
