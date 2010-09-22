class CreateParticipantes < ActiveRecord::Migration
  def self.up
    create_table :participantes do |t|
      t.string :nome
      t.integer :matricula
      t.string :endereco
      t.string :cidade
      t.string :bairro
      t.string :estado
      t.integer :foneres
      t.integer :fonecom
      t.integer :cel
      t.string :email
      t.string :trabalho
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :participantes
  end
end
