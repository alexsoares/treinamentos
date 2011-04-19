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

ActiveRecord::Schema.define(:version => 20110418162522) do

  create_table "cursos", :force => true do |t|
    t.string   "nome"
    t.string   "ministrante"
    t.string   "tipo"
    t.string   "carga_horaria"
    t.string   "obs"
    t.datetime "data_hora"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "nome"
    t.integer  "matricula"
    t.string   "endereco"
    t.string   "cidade"
    t.string   "bairro"
    t.string   "estado"
    t.integer  "foneres"
    t.integer  "fonecom"
    t.integer  "cel"
    t.string   "email"
    t.string   "trabalho"
    t.string   "obs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "professors", :force => true do |t|
    t.integer  "matricula",                                                                      :null => false
    t.string   "nome",                                                                           :null => false
    t.datetime "dt_atual"
    t.datetime "dt_ingresso"
    t.datetime "dt_nasc"
    t.string   "RG",               :limit => 20,                                :default => "0"
    t.string   "CPF",              :limit => 20,                                :default => "0"
    t.integer  "INEP",                                                          :default => 0
    t.integer  "RD",                                                            :default => 0
    t.integer  "n_filhos",                                                      :default => 0
    t.integer  "sede_id",                                                                        :null => false
    t.integer  "jornada_sem",                                                   :default => 0
    t.string   "funcao",                                                                         :null => false
    t.string   "endres"
    t.string   "complemento"
    t.string   "bairro"
    t.integer  "num"
    t.integer  "telefone"
    t.string   "cidade"
    t.string   "obs"
    t.decimal  "total_trabalhado",               :precision => 10, :scale => 3, :default => 0.0
    t.decimal  "total_titulacao",                :precision => 10, :scale => 3, :default => 0.0
    t.decimal  "pontuacao_final",                :precision => 10, :scale => 3, :default => 0.0
    t.integer  "flag",                                                          :default => 0,   :null => false
    t.integer  "sede_id_ant"
    t.string   "log_user",         :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "titulo_arrumado"
  end

  create_table "regiaos", :force => true do |t|
    t.string   "nome"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unidades", :force => true do |t|
    t.string   "nome"
    t.integer  "tipo"
    t.integer  "regiao_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
