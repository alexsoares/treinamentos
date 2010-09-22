# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100909123350) do

  create_table "cursos", :force => true do |t|
    t.string   "Nome"
    t.string   "Ministrante"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "Obs"
    t.datetime "Ano"
  end

  create_table "inscricaos", :force => true do |t|
    t.integer  "participante_id", :null => false
    t.integer  "curso_id",        :null => false
    t.date     "data_inscricao"
    t.string   "inscrito"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participantes", :force => true do |t|
    t.string   "Nome"
    t.integer  "Matricula"
    t.string   "Endereco"
    t.string   "Cidade"
    t.string   "Bairro"
    t.string   "Estado"
    t.integer  "FoneRes"
    t.integer  "FoneCom"
    t.integer  "Cel"
    t.string   "Email"
    t.string   "Trabalho"
    t.string   "Obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
