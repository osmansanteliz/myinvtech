class CreateEmpleados < ActiveRecord::Migration[7.1]
  def change
    create_table :empleados do |t|
      t.references :empresa, null: false, foreign_key: true
      t.string :nombre
      t.string :apellido
      t.string :departamento
      t.string :responsable_area
      t.string :extension

      t.timestamps
    end
  end
end
