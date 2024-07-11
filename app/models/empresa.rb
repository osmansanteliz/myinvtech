class Empresa < ApplicationRecord
  validates :nombre, presence: true

  has_many :empleados, dependent: :destroy

  accepts_nested_attributes_for :empleados
end
