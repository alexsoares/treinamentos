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

ActiveRecord::Schema.define(:version => 20110428170610) do

  create_table "cursos", :force => true do |t|
    t.string   "nome_curto"
    t.string   "nome"
    t.string   "ministrante"
    t.string   "carga_horaria"
    t.text     "ementa"
    t.text     "obs"
    t.datetime "data_hora"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cursos_inscricaos", :id => false, :force => true do |t|
    t.integer "curso_id",     :null => false
    t.integer "inscricao_id", :null => false
  end

  create_table "inscricaos", :force => true do |t|
    t.integer  "participante_id", :null => false
    t.date     "data_inscricao"
    t.string   "inscrito"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participantes", :force => true do |t|
    t.string   "nome"
    t.integer  "matricula"
    t.integer  "unidade_id"
    t.string   "funcao"
    t.string   "endereco"
    t.string   "num"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "telefone"
    t.integer  "cel"
    t.string   "email"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tipo_participante"
  end

  create_table "perguntas", :force => true do |t|
    t.integer  "pesquisa_id"
    t.text     "conteudo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pesquisas", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regiaos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "respostas", :force => true do |t|
    t.integer  "pergunta_id"
    t.string   "conteudo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string "name"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  add_index "roles_users", ["role_id"], :name => "index_roles_users_on_role_id"
  add_index "roles_users", ["user_id"], :name => "index_roles_users_on_user_id"

  create_table "unidades", :force => true do |t|
    t.string   "nome"
    t.integer  "tipo"
    t.integer  "regiao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
