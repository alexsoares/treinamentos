class HomeController < ApplicationController



  def entrar
      redirect_to(new_home_path)
  end

def inscreverse
     $var = 1
      redirect_to(new_inscricao_path)
  end

def gerenciar
      $var = 0
      redirect_to(new_gerenciar_path)
  end

  
  end



