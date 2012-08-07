class AddOpcoesToInscricaos < ActiveRecord::Migration
  def self.up
    add_column :inscricaos, :opcao1, :integer
    add_column :inscricaos, :opcao2, :integer
  end

  def self.down
    remove_column :inscricaos, :opcao2
    remove_column :inscricaos, :opcao1
  end
end
