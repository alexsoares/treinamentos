class AddTurnosToInscricaos < ActiveRecord::Migration
  def self.up
    add_column :inscricaos, :periodo_opcao1, :string
    add_column :inscricaos, :periodo_opcao2, :string
  end

  def self.down
    remove_column :inscricaos, :periodo_opcao2
    remove_column :inscricaos, :periodo_opcao1
  end
end
