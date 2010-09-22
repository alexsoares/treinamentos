class CreateInscricaos < ActiveRecord::Migration
  def self.up
    create_table :inscricaos do |t|
      t.references :participante, :null => false
      t.references :curso, :null => false
      t.date :data_inscricao
      t.string :inscrito, :null => true

      t.timestamps
    end
  end

  def self.down
    drop_table :inscricaos
  end
end
