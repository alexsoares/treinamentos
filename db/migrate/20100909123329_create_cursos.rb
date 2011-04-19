class CreateCursos < ActiveRecord::Migration
  def self.up
    create_table :cursos do |t|
      t.string :nome
      t.string :ministrante
      t.string :tipo
      t.string :carga_horaria
      t.string :ementa
      t.string :obs
      t.datetime :data_hora 

      t.timestamps
    end
  end

  def self.down
    drop_table :cursos
  end
end
