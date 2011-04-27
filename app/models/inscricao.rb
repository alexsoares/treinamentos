class Inscricao < ActiveRecord::Base
  belongs_to :participante, :dependent => :destroy
  has_and_belongs_to_many :cursos
  accepts_nested_attributes_for :participante

  validates_uniqueness_of :participante_id, :message => " Error => Este participante já efetuou a inscrição"
  
end