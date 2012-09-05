class Inscricao < ActiveRecord::Base
  
  belongs_to :participante, :dependent => :destroy
  #belongs_to :opcao1, :class_name => 'Unidade', :foreign_key => "opcao1"
  #belongs_to :opcao2, :class_name => 'Unidade', :foreign_key => "opcao2"
  before_save :mesma_opcao
  has_and_belongs_to_many :cursos
  accepts_nested_attributes_for :participante
  validates_presence_of :participante_id
  validates_presence_of :opcao1, :if => :verifica_opcao
  validates_presence_of :opcao2, :if => :verifica_opcao2
  validates_uniqueness_of :participante_id, :message => " Error => Este participante já efetuou a inscrição"
  Periodo = %w(Matutino Vespertino Noturno Sabado_Matutino)

  def mesma_opcao
    unless self.opcao2.present?
      self.opcao2 = self.opcao1
      self.periodo_opcao2 = self.periodo_opcao1
    end
  end
  def verifica_opcao
    if self.opcao1 == ""
      true
    else
      false
    end
  end
    def verifica_opcao2
    if self.opcao2 == ""
      true
    else
      false
    end
  end

  def unidade(codigo)
    Unidade.find(codigo).nome
  end

end