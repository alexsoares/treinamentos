class Inscricao < ActiveRecord::Base
  
  belongs_to :participante, :dependent => :destroy
  belongs_to :unidade, :class_name => 'Unidade', :foreign_key => "opcao1"
  belongs_to :unidade, :class_name => 'Unidade', :foreign_key => "opcao2"
  has_and_belongs_to_many :cursos
  accepts_nested_attributes_for :participante
  validates_presence_of :participante_id
  validates_uniqueness_of :participante_id, :message => " Error => Este participante já efetuou a inscrição"
  Periodo = %w(Matutino Vespertino Noturno Sabado_Matutino)
end