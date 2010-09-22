class Curso < ActiveRecord::Base
  has_many :inscricaos

  def before_save
    self.nome.upcase!
    self.ministrante.upcase!
    self.obs.upcase!
    
  end

end
