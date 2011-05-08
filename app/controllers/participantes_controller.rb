class ParticipantesController < ApplicationController
  # GET /participantes
  # GET /participantes.xml

  # Tipo participante
  # 1 - Interno
  # 2 - Externo

  before_filter :load_participantes
  layout :logado?

  before_filter :load_unidades

  def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end

  def logado?
    if logged_in?
      "gerenciar"
    else
      "cadastral"
    end
  end

   def load_participantes
    @participantes = Participante.find(:all, :order => 'nome ASC')
  end

  def ger_index
    @participantes = Participante.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @participantes }
    end
  end

  def index
    if (params[:search].nil? || params[:search].empty?)
       @participantes = Participante.find(:all)
    else
       @participantes = Participante.find(:all, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"], :order => 'nome ASC')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @participantes }
    end
  end

  # GET /participantes/1
  # GET /participantes/1.xml
  def show
    @participante = Participante.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @participante }
    end
  end

  # GET /participantes/new
  # GET /participantes/new.xml
  def new
    @participante = Participante.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @participante }
    end
  end

  # GET /participantes/1/edit
  def edit
    @participante = Participante.find(params[:id])
  end

  # POST /participantes
  # POST /participantes.xml
  def create
    @participante = Participante.new(params[:participante])

    respond_to do |format|
      if @participante.save
        flash[:notice] = 'PARTICIPANTE CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@participante) }
        format.xml  { render :xml => @participante, :status => :created, :location => @participante }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @participante.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /participantes/1
  # PUT /participantes/1.xml
  def update
    @participante = Participante.find(params[:id])
    respond_to do |format|
      if @participante.update_attributes(params[:participante])
        flash[:notice] = 'PARTICIPANTE ATUALIZADO COM SUCESSO.'
        format.html { redirect_to(@participante) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @participante.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /participantes/1
  # DELETE /participantes/1.xml
  def destroy
    @participante = Participante.find(params[:id])
    @participante.destroy

    respond_to do |format|
      format.html { redirect_to(participantes_url) }
      format.xml  { head :ok }
    end
  end

def consulta
    render :partial => 'consultas'
  end


  def lista_participante
    @participantes = Participante.find(:all, :conditions => ["id = ",params[:participante_participante_id]])
    render :partial => 'lista_participantes'
  end


  def lista_participante_index
    @participantes = Participante.find(:all, :conditions => ["id = ?",params[:participante_participante_id] ])
       format.html { render :action => "index" }
  end

  def mesmo_nome
    @verifica = Participante.find_by_nome(params[:participante_nome])
    if @verifica then
      render :update do |page|
        page.replace_html 'nome_aviso', :text => 'NOME JÁ CONSTA NO SISTEMA'
        page.replace_html 'Certeza', :text => "PARTICIPANTE JÁ CADASTRADO "
      end
    else
      render :update do |page|
        page.replace_html 'nome_aviso', :text => ''
      end
    end
  end
end
