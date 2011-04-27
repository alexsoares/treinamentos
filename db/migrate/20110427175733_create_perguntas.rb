class CreatePerguntas < ActiveRecord::Migration
  def self.up
    create_table :perguntas do |t|
      t.integer :pesquisa_id
      t.text :conteudo

      t.timestamps
    end
  end

  def self.down
    drop_table :perguntas
  end
end
