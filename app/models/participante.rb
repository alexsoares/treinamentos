class Participante < ActiveRecord::Base
  has_many :inscricaos

  validates_presence_of :nome, :message => ' - NOME É PREENCHIMENTO OBRIGATÓRIO'
  validates_presence_of :cel, :message => ' - N° CELULAR É PREENCHIMENTO OBRIGATÓRIO'
  validates_presence_of :matricula, :message => ' - Nº MATRICULA É PREENCHIMENTO OBRIGATÓRIO'

def before_save
    self.nome.upcase!
    self.endereco.upcase!
    self.bairro.upcase!
    self.cidade.upcase!
    self.estado.upcase!
    self.trabalho.upcase!
    self.obs.upcase!
        
  end



end
