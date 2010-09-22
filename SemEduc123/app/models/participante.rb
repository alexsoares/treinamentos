class Participante < ActiveRecord::Base
  has_many :inscricaos


def before_save
    self.Nome.upcase!
    self.Endereco.upcase!
    self.Bairro.upcase!
    self.Cidade.upcase!
    self.Estado.upcase!
    self.Trabalho.upcase!
    self.Obs.upcase!
        
  end



end
