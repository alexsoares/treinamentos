class Inscricao < ActiveRecord::Base
  belongs_to :participante
  belongs_to :curso


validate :jainscrito
validate :limite

  private

def jainscrito
  valor = Inscricao.find(:all, :conditions => ['participante_id = ? and curso_id = ?', self.participante_id, self.curso_id])
  if !(valor.empty?)
     errors.add(:id, 'INSCRIÇÃO JÁ REALIZADA ...................................................... Clique em |Voltar| para continuar')
  end
end

def limite
  tipo = Curso.find(self.curso_id, :select => 'tipo').tipo

  if (tipo == 'Teatro') or (tipo == 'Palestra') then
    vlimite = Inscricao.find(:all, :conditions => ["curso_id=?",self.curso_id]).length
      if (vlimite > 850)
            errors.add(:id, '>>>> INSCRIÇÃO ENCERRADAS PARA ESTE CURSO <<<<   >>>>>> SELECIONE OUTRO CURSO <<<<<<                        ............................. Clique em |Voltar| para continuar')
       end
  else
    vlimite = Inscricao.find(:all, :conditions => ["curso_id=?",self.curso_id]).length
     if (vlimite > 40)
       errors.add(:id, '>>>> INSCRIÇÃO ENCERRADAS PARA ESTE CURSO <<<<   >>>>>> SELECIONE OUTRO CURSO <<<<<<                        ............................. Clique em |Voltar| para continuar')
    end
end
end

def self.tamanho_inscricao(curso)
  find(:all, :conditions => ["curso_id = ?",curso]).length
end

end