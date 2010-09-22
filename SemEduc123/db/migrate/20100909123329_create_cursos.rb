class CreateCursos < ActiveRecord::Migration
  def self.up
    create_table :cursos do |t|
      t.string :Nome
      t.string :Ministrante
      t.timestamps :CargaHoraria
      t.string :Obs
      t.datetime :Ano

      t.timestamps
    end
  end

  def self.down
    drop_table :cursos
  end
end
