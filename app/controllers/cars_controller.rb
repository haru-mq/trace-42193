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

  def show
    @car = Car.find(params[:id])
    @calculation = Calculation.new(car_id: @car.id)
    @calculations = @car.calculations.includes(:car)
    @signalinfo = Signalinfo.new
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    if @car.update(car_params)
      redirect_to car_path(@car)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to '/'
  end

  def history
    @car = Car.find(params[:id])
    raw_versions = PaperTrail::Version.where(car_id: @car.id)

    user_ids = raw_versions.map(&:whodunnit).map(&:to_i)
    users = User.where(id: user_ids).index_by(&:id)

    @history = raw_versions.map do |v|
      {
        time:   v.created_at,
        user:   users[v.whodunnit.to_i],
        event:  v.event,
        model:  v.item_type,
        car:    Car.find_by(id: v.car_id),
        calculation:  v.item_type == "Signalinfo" ? Calculation.find_by(id: v.calculation_id) : (v.item_type == "Calculation" ? Calculation.find_by(id: v.calculation_id) : nil),
        signal_name:   v.item_type == "Signalinfo" ? v.signal_name : nil,
        signal_type_id: v.item_type == "Signalinfo" ? SignalType.find_by(id: v.signal_type_id) : nil,
        reason: v.reason
      }
    end
  end

  private

  def car_params
    params.require(:car).permit(:car_name, :launch_date).merge(user_id: current_user.id)
  end

end
