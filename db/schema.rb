# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_04_204831) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "empleados", force: :cascade do |t|
    t.bigint "empresa_id", null: false
    t.string "nombre"
    t.string "apellido"
    t.string "departamento"
    t.string "responsable_area"
    t.string "extension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empresa_id"], name: "index_empleados_on_empresa_id"
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipos", force: :cascade do |t|
    t.bigint "tipo_equipo_id", null: false
    t.bigint "marca_id", null: false
    t.string "serie"
    t.bigint "estado_id", null: false
    t.string "modelo"
    t.string "service_tag"
    t.string "ip"
    t.boolean "garantia"
    t.bigint "empleado_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empleado_id"], name: "index_equipos_on_empleado_id"
    t.index ["estado_id"], name: "index_equipos_on_estado_id"
    t.index ["marca_id"], name: "index_equipos_on_marca_id"
    t.index ["tipo_equipo_id"], name: "index_equipos_on_tipo_equipo_id"
  end

  create_table "estados", force: :cascade do |t|
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marcas", force: :cascade do |t|
    t.string "marca"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.string "equipo"
    t.string "marca"
    t.string "modelo"
    t.string "serie"
    t.string "ubicacion"
    t.string "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_equipos", force: :cascade do |t|
    t.string "tipo_equipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "password_confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "empleados", "empresas"
  add_foreign_key "equipos", "empleados"
  add_foreign_key "equipos", "estados"
  add_foreign_key "equipos", "marcas"
  add_foreign_key "equipos", "tipo_equipos"
end
