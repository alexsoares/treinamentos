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

ActiveRecord::Schema.define(:version => 20110425102918) do

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
    t.integer  "participante_id",     :null => false
    t.integer  "cursos_inscricao_id", :null => false
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

  create_table "professors", :force => true do |t|
    t.integer  "matricula"
    t.string   "nome"
    t.datetime "dt_atual"
    t.datetime "dt_ingresso"
    t.datetime "dt_nasc"
    t.integer  "RG"
    t.integer  "CPF"
    t.integer  "INEP"
    t.integer  "RD"
    t.integer  "n_filhos"
    t.integer  "sede_id"
    t.integer  "jornada_sem"
    t.string   "funcao"
    t.string   "endres"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "num"
    t.string   "telefone"
    t.string   "cidade"
    t.string   "obs"
    t.integer  "total_trabalhado", :limit => 10, :precision => 10, :scale => 0
    t.integer  "total_titulacao",  :limit => 10, :precision => 10, :scale => 0
    t.integer  "pontuacao_final",  :limit => 10, :precision => 10, :scale => 0
    t.integer  "flag"
    t.integer  "sede_id_ant_id"
    t.string   "log_user"
    t.datetime "created_at"
    t.datetime "updated_at"
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
