class Api::V1::UnitsController < ActionController::API
  include SessionsHelper
  before_action :authenticate_logged_in, only: [:show, :create, :update, :destroy]
  before_action :find_unit, only: [:show, :create, :update, :destroy]

  def index
    units = Unit.all
    if units
      render json: {status: "SUCCESS", message: "Fetched all the units successfully", data: units}, include: 'weapons', status: :ok
    else
      render json: units.errors, status: :bad_request
    end
  end

  def show
    if @unit
      render json: {data: @unit}, include: 'weapons', state: :ok
    else
      render json: {message: "Unit could not be found"}, status: :bad_request
    end
  end

  def create
    if @unit.save
      render json: {status: "SUCCESS", message: "Unit was created successfully!", data: @unit}, status: :created
    else
      render json: @unit.errors, status: :unprocessable_entity
    end
  end

  def update
    if @unit.update!(unit_params)
      render json: {message: "Unit was updated successfully", data: @unit}, status: :ok
    else
      render json: {message: "Unit cannot be updated"}, status: :unprocessable_entity
    end
  end

  def destroy
    if @unit.destroy!
      render json: {message: "Unit was deleted successfully"}, status: :ok
    else
      render json: {message: "Unit does not exist"}, status: :bad_request
    end
  end

  private

  def unit_params
    params.require(:unit).permit(:name, :unitsize, :wounds, :bravery, :unitsave, :weapons, :img)
  end

  def find_unit
    @unit = Unit.find(params[:id])
  end

  def authenticate_logged_in
    unless logged_in?
      render json: { errors: ["You need to be logged in"] }, status: 401
    end
  end
end
