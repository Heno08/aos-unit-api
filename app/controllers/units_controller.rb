class UnitsController < ApplicationController
  def index
    units = Unit.all
    render json: units, include: 'weapons'
  end
end
