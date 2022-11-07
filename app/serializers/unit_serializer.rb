class UnitSerializer < ActiveModel::Serializer
  attributes :id, :name, :unitsize, :wounds, :bravery, :unitsave

  has_many :weapons, serializer: WeaponSerializer
end
