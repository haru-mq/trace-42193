class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def car_params
    params.require(:car).permit(:car_name, :launch_date).merge(user_id: current_user.id)
  end

end
