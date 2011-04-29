class PesquisasController < ApplicationController
  layout 'cadastral'
  # GET /pesquisas
  # GET /pesquisas.xml
  def index
    @pesquisas = Pesquisa.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pesquisas }
    end
  end

  # GET /pesquisas/1
  # GET /pesquisas/1.xml
  def show
    @pesquisa = Pesquisa.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pesquisa }
    end
  end

  # GET /pesquisas/new
  # GET /pesquisas/new.xml
  def new
    @pesquisa = Pesquisa.new
    1.times do
      pergunta = @pesquisa.perguntas.build
      4.times { pergunta.respostas.build }
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pesquisa }
    end
  end

  # GET /pesquisas/1/edit
  def edit
    @pesquisa = Pesquisa.find(params[:id])
  end

  # POST /pesquisas
  # POST /pesquisas.xml
  def create
    @pesquisa = Pesquisa.new(params[:pesquisa])

    respond_to do |format|
      if @pesquisa.save
        flash[:notice] = 'Pesquisa was successfully created.'
        format.html { redirect_to(@pesquisa) }
        format.xml  { render :xml => @pesquisa, :status => :created, :location => @pesquisa }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pesquisa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pesquisas/1
  # PUT /pesquisas/1.xml
  def update
    @pesquisa = Pesquisa.find(params[:id])

    respond_to do |format|
      if @pesquisa.update_attributes(params[:pesquisa])
        flash[:notice] = 'Pesquisa was successfully updated.'
        format.html { redirect_to(@pesquisa) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pesquisa.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pesquisas/1
  # DELETE /pesquisas/1.xml
  def destroy
    @pesquisa = Pesquisa.find(params[:id])
    @pesquisa.destroy

    respond_to do |format|
      format.html { redirect_to(pesquisas_url) }
      format.xml  { head :ok }
    end
  end
end
