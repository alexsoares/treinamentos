class SessionsController < ApplicationController
  layout 'cadastral'
  def new
  end

  def create
    session[:password] = params[:password]
    $teste = params[:password]
    flash[:notice] = 'BEM VINDO AO GERENCIAMENTO DO SISTEMA'
    redirect_to gerenciars_path
    $Var = 1
  end

  def destroy
    reset_session
    flash[:notice] = 'VOCÊ ESTÁ SAINDO DO GERENCIAMENTO DO SISTEMA'
    redirect_to root_path
    $Var = 0
  end

end
