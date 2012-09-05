class Curso < ActiveRecord::Base
  has_and_belongs_to_many :inscricaos
  has_many :unidades
  has_many :participantes
   validates_presence_of :nome, :message => ' ==> PREENCHER DE DADOS OBRIGATÓRIO <=='
   validates_presence_of :ministrante, :message => ' ==> PREENCHER DE DADOS OBRIGATÓRIO <=='
  

  def before_save
    if self.nome.present?
      self.nome.upcase
    end
    if self.ministrante.present?
      self.ministrante.upcase
    end
    if self.obs.present?
      self.obs.upcase
    end
  end

  def truncar_curso
    if self.nome_curto.length > 20
      str = self.nome_curto
      str[0..20]
    else
      self.nome_curto
    end
  end


end
