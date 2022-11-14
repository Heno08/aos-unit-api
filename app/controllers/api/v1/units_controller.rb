class Api::V1::UnitsController < ApplicationController
  def index
    units = Unit.all

    if units
      render json: {status: "SUCCESS", message: "Fetched all the units successfully", data: units}, include: 'weapons', status: :ok
    else
      render json: units.errors, status: :bad_request
    end
  end

  def show
    unit = Unit.find(params[:id])

    if unit
      render json: {data: unit}, include: 'weapons', state: :ok
    else
      render json: {message: "Unit could not be found"}, status: :bad_request
    end
  end

  def create
    unit = Unit.new(unit_params)

    if unit.save
      render json: {status: "SUCCESS", message: "Unit was created successfully!", data: unit}, status: :created
    else
      render json: unit.errors, status: :unprocessable_entity
    end
  end

  def update
    unit = Unit.find(params[:id])

    if unit.update!(unit_params)
      render json: {message: "Unit was updated successfully", data: unit}, status: :ok
    else
      render json: {message: "Unit cannot be updated"}, status: :unprocessable_entity
    end
  end

  def destroy
    unit = Unit.find(params[:id])

    if unit.destroy!
      render json: {message: "Unit was deleted successfully"}, status: :ok
    else
      render json: {message: "Unit does not exist"}, status: :bad_request
    end
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :unitsize, :wounds, :bravery, :unitsave, :weapons, :img)
  end
end
