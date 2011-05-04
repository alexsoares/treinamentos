class HomesController < ApplicationController
  
layout :define

  def define
    if logged_in?
      'gerenciar'
    else
      'inicial'
    end
  end

  def index
  end


end
