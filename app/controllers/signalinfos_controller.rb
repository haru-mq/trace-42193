class SignalinfosController < ApplicationController

  def create
    @signalinfo = Signalinfo.new(signalinfo_params)
    if @signalinfo.save
      redirect_to car_path(@signalinfo.calculation.car_id)
    else
      @car = Car.find(params[:car_id])
      @calculation = Calculation.new(car_id: @car.id)
      @calculations = @car.calculations.includes(:car)
      render 'cars/show', status: :unprocessable_entity
    end
  end

  def edit
    @car = Car.find(params[:car_id])
    @calculation = Calculation.find(params[:calculation_id])
    @signalinfo = Signalinfo.find(params[:id])
  end

  def update
    @signalinfo = Signalinfo.find(params[:id])
    if @signalinfo.update(signalinfo_params)
      redirect_to car_path(@signalinfo.calculation.car_id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @signalinfo = Signalinfo.find(params[:id])
    @signalinfo.destroy
    redirect_to car_path(@signalinfo.calculation.car_id)
  end

  private

  def signalinfo_params
    params.require(:signalinfo).permit(:signal_name, :signal_type_id).merge(calculation_id: params[:calculation_id])
  end
    
end
