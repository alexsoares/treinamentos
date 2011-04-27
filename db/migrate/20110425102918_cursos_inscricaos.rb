class CursosInscricaos < ActiveRecord::Migration
  def self.up
    create_table :cursos_inscricaos, :id => false do |t|
      t.references :curso, :null => false
      t.references :inscricao, :null => false
    end
  end

  def self.down
  end
end
