class UnitSerializer < ActiveModel::Serializer
  attributes :id, :name, :unitsize, :wounds, :bravery, :unitsave
end
