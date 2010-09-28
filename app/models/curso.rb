class Curso < ActiveRecord::Base
  has_many :inscricaos

   validates_presence_of :nome, :message => ' ==> PREENCHER DE DADOS OBRIGATÓRIO <=='
   validates_presence_of :ministrante, :message => ' ==> PREENCHER DE DADOS OBRIGATÓRIO <=='
  

  def before_save
    self.nome.upcase!
    self.ministrante.upcase!
    self.obs.upcase!
    
  end

end
