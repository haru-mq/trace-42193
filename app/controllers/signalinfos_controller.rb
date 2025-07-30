class SignalinfosController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_signalinfo, only: [:update, :destroy]

  def create
    @signalinfo = Signalinfo.new(signalinfo_params)
    if @signalinfo.save
      redirect_to car_path(@signalinfo.calculation.car_id)
    else
      flash[:errors_signalinfo_create] = @signalinfo.errors.full_messages
      flash[:input_signalinfo_create] = params[:signalinfo]
      handle_signalinfo_error
    end
  end

  def update
    if @signalinfo.update(signalinfo_params)
      redirect_to car_path(@signalinfo.calculation.car_id)
    else
      flash[:errors_signalinfo_update] = @signalinfo.errors.full_messages
      flash[:input_signalinfo_update] = params[:signalinfo]
      flash[:signalinfo_error_id] = {
        car_id: @signalinfo.calculation.car_id,
        calculation_id: @signalinfo.calculation.id,
        signalinfo_id: @signalinfo.id
      }
      handle_signalinfo_error
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

  def handle_signalinfo_error
    @car = Car.find(params[:car_id])
    @calculation = Calculation.new(car_id: @car.id)
    @calculations = @car.calculations.includes(:car)
    redirect_to car_path(@car)
  end

    
end
