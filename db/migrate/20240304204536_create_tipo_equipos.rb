class CreateTipoEquipos < ActiveRecord::Migration[7.1]
  def change
    create_table :tipo_equipos do |t|
      t.string :tipo_equipo

      t.timestamps
    end
  end
end
