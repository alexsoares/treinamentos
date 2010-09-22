class CreateParticipantes < ActiveRecord::Migration
  def self.up
    create_table :participantes do |t|
      t.string :Nome
      t.integer :Matricula
      t.string :Endereco
      t.string :Cidade
      t.string :Bairro
      t.string :Estado
      t.integer :FoneRes
      t.integer :FoneCom
      t.integer :Cel
      t.string :Email
      t.string :Trabalho
      t.string :Obs

      t.timestamps
    end
  end

  def self.down
    drop_table :participantes
  end
end
