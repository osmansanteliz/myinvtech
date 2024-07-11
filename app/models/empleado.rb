class Empleado < ApplicationRecord
  validates :nombre, :apellido, :departamento, :responsable_area, :extension, presence: true

  belongs_to :empresa
  has_many :equipos
end
