class CreateStocks < ActiveRecord::Migration[7.1]
  def change
    create_table :stocks do |t|
      t.string :equipo
      t.string :marca
      t.string :modelo
      t.string :serie
      t.string :ubicacion
      t.string :estado

      t.timestamps
    end
  end
end
