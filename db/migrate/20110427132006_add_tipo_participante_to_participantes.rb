class AddTipoParticipanteToParticipantes < ActiveRecord::Migration
  def self.up
    add_column :participantes, :tipo_participante, :integer, :default => 1
  end
    
  def self.down
    remove_column :participantes, :tipo_participante
  end
end
