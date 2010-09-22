class Curso < ActiveRecord::Base
  has_many :inscricaos

  def before_save
    self.Nome.upcase!
    self.Ministrante.upcase!
    self.Obs.upcase!
    
  end

end
