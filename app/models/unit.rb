class Unit < ApplicationRecord
  has_many :weapons, dependent: :destroy
end
