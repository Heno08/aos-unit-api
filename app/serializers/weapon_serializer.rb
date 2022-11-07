class WeaponSerializer < ActiveModel::Serializer
  attributes :id, :name, :attacks, :tohit, :towound, :rend, :dmg

  belongs_to :unit
end
