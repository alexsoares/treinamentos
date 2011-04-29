class CreateRespostas < ActiveRecord::Migration
  def self.up
    create_table :respostas do |t|
      t.integer :pergunta_id
      t.string :conteudo

      t.timestamps
    end
  end

  def self.down
    drop_table :respostas
  end
end
