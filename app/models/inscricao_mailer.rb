class InscricaoMailer < ActionMailer::Base

def confirmacao_inscricao(inscricao,participante)
  recipients participante.email
  subject "Texto"
  from  "informatica@seducpma.com"
  body :participante => participante, :inscricao => inscricao
end

end
