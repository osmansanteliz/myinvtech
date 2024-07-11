class Equipo < ApplicationRecord
  validates :serie, :modelo, :service_tag, :ip, :garantia, presence: true
  has_many :tipo_equipo
  belongs_to :marca
  belongs_to :estado
  belongs_to :empleado
end
