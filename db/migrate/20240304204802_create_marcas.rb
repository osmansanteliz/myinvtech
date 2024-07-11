class CreateMarcas < ActiveRecord::Migration[7.1]
  def change
    create_table :marcas do |t|
      t.string :marca

      t.timestamps
    end
  end
end
