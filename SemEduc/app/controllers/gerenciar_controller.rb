class GerenciarController < ApplicationController

    before_filter :load_cursos
    before_filter :load_participantes

   def load_participantes
    @participantes = Participante.find(:all, :order => 'nome ASC')
  end


  def load_cursos
    @cursos = Curso.find(:all, :order => 'nome ASC')

  end

  def sobresis
    render :update do |page|
        page.replace_html 'tela_sobre', :text => ''
        page.replace_html 'tela_sobre', :partial => 'sobre'
    end
  end

 

  
end
