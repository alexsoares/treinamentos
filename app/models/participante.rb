class Participante < ActiveRecord::Base
  has_many :inscricaos
  belongs_to :unidade
  has_many :cursos
  validates_presence_of :nome, :message => ' - NOME É PREENCHIMENTO OBRIGATÓRIO'
  validates_presence_of :matricula, :if => :tipo? , :message => ' <br/> => Nº MATRICULA É PREENCHIMENTO OBRIGATÓRIO PARA PARTICIPANTES INTERNOS'
  validates_presence_of :unidade_id, :if => :tipo? , :message => " - UNIDADE É PREENCHIMENTO OBRIGATÓRIO PARA PARTICIPANTES INTERNOS"
def before_save
    self.nome.upcase!
    self.endereco.upcase!
    self.bairro.upcase!
    self.cidade.upcase!
    self.obs.upcase!        
end

protected

def tipo?
  if self.tipo_participante == 1
    true
  else
    if self.tipo_participante == 2
      true
    end
  end
end


end
