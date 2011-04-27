class CreatePesquisas < ActiveRecord::Migration
  def self.up
    create_table :pesquisas do |t|
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :pesquisas
  end
end
