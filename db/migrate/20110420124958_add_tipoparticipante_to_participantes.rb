class AddTipoparticipanteToParticipantes < ActiveRecord::Migration
  def self.up
    add_column :participantes, :tipo_participante, :integer
  end

  def self.down
    remove_column :participantes, :tipo_participante
  end
end
