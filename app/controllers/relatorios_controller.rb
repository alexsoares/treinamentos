class RelatoriosController < ApplicationController
  def index
    @relatorios = Relatorio.all
  end

  def show
    @relatorio = Relatorio.find(params[:id])
  end

  def new
    @relatorio = Relatorio.new
  end

  def create
    @relatorio = Relatorio.new(params[:relatorio])
    if @relatorio.save
      flash[:notice] = "Successfully created relatorio."
      redirect_to @relatorio
    else
      render :action => 'new'
    end
  end

  def edit
    @relatorio = Relatorio.find(params[:id])
  end

  def update
    @relatorio = Relatorio.find(params[:id])
    if @relatorio.update_attributes(params[:relatorio])
      flash[:notice] = "Successfully updated relatorio."
      redirect_to @relatorio
    else
      render :action => 'edit'
    end
  end

  def destroy
    @relatorio = Relatorio.find(params[:id])
    @relatorio.destroy
    flash[:notice] = "Successfully destroyed relatorio."
    redirect_to relatorios_url
  end
end
