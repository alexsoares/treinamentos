class CreateCursosInscricaos < ActiveRecord::Migration
  def self.up
    create_table :cursos_inscricaos do |t|
      t.references :curso

      t.timestamps
    end
  end

  def self.down
    drop_table :cursos_inscricaos
  end
end
