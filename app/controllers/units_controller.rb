class UnitsController < ApplicationController
  def index
    units = Unit.all
    render json: units, include: 'weapons'
  end

  def new
    @unit = Unit.new
  end

  def create
    @unit = Unit.new(params[unit_params])
    @unit.save
    redirect_to units_path
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :unitsize, :wounds, :bravery, :unitsave)
  end
end
