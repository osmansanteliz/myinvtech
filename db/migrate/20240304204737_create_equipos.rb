class CreateEquipos < ActiveRecord::Migration[7.1]
  def change
    create_table :equipos do |t|
      t.references :tipo_equipo, null: false, foreign_key: true
      t.references :marca, null: false, foreign_key: true
      t.string :serie
      t.references :estado, null: false, foreign_key: true
      t.string :modelo
      t.string :service_tag
      t.string :ip
      t.boolean :garantia
      t.references :empleado, null: false, foreign_key: true

      t.timestamps
    end
  end
end
