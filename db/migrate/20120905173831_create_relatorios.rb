class CreateRelatorios < ActiveRecord::Migration
  def self.up
    create_table :relatorios do |t|
      t.string :path
      t.string :ip
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :relatorios
  end
end
