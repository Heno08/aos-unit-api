class Api::V1::WeaponsController < ApplicationController
  def index
    weapons = Weapon.all

    if weapons
      render json: {status: "SUCCESS", message: "Fetched all the weapons successfully", data: weapons}, status: :ok
    else
      render json: weapons.errors, status: :bad_request
    end
  end

  def show
    weapon = Weapon.find(params[:id])

    if weapon
      render json: {data: weapon}, state: :ok
    else
      render json: {message: "Weapon could not be found"}, status: :bad_request
    end
  end

  def create
    unit = Unit.find(params[:unit_id])
    weapon = Weapon.new(weapon_params)
    weapon.unit = unit

    if weapon.save
      render json: {status: "SUCCESS", message: "Weapon was created successfully!", data: weapon}, status: :created
    else
      render json: weapon.errors, status: :unprocessable_entity
    end
  end

  def update
    weapon = Weapon.find(params[:id])

    if weapon.update!(weapon_params)
      render json: {message: "Weapon was updated successfully", data: weapon}, status: :ok
    else
      render json: {message: "Weapon cannot be updated"}, status: :unprocessable_entity
    end
  end

  def destroy
    weapon = Weapon.find(params[:id])

    if weapon.destroy!
      render json: {message: "Weapon was deleted successfully"}, status: :ok
    else
      render json: {message: "Weapon does not exist"}, status: :bad_request
    end
  end

  private

  def weapon_params
    params.require(:weapon).permit(:name, :attacks, :tohit, :towound, :rend, :dmg)
  end

end
