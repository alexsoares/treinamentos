class CreateProfessors < ActiveRecord::Migration
  def self.up
    create_table :professors do |t|
      t.integer :matricula
      t.string :nome
      t.datetime :dt_atual
      t.datetime :dt_ingresso
      t.datetime :dt_nasc
      t.integer :RG
      t.integer :CPF
      t.integer :INEP
      t.integer :RD
      t.integer :n_filhos
      t.references :sede
      t.integer :jornada_sem
      t.string :funcao
      t.string :endres
      t.string :complemento
      t.string :bairro
      t.string :num
      t.string :telefone
      t.string :cidade
      t.string :obs
      t.decimal :total_trabalhado
      t.decimal :total_titulacao
      t.decimal :pontuacao_final
      t.integer :flag
      t.references :sede_id_ant
      t.string :log_user

      t.timestamps
    end
  end

  def self.down
    drop_table :professors
  end
end
