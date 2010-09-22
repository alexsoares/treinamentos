class SessionsController < ApplicationController
  layout 'cadastral'
  def new
  end

  def create
    session[:password] = params[:password]
    $teste = params[:password]
    flash[:notice] = 'Bem vindo ao setor gerencial'
    redirect_to gerenciars_path
  end

  def destroy
    reset_session
    flash[:notice] = 'Saída do sistema realizada com sucesso'
    redirect_to root_path
  end

end
