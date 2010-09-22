class ParticipantesController < ApplicationController
  # GET /participantes
  # GET /participantes.xml
    before_filter :load_participantes

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
    @participantes = Participante.find(:all)

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
        flash[:notice] = 'Participante was successfully created.'
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
        flash[:notice] = 'Participante was successfully updated.'
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
     $part_id = params[:id]
     @inscricao = Inscricao.find(:all, :conditions => ['participante_id = ' + $part_id])
     for inscri in @inscricao
      inscri.destroy
     end
    @participante.destroy

    respond_to do |format|
      format.html { redirect_to(participantes_url) }
      format.xml  { head :ok }
    end
  end


  def soma_dias
    @soma_dias = Trabalhado.find_by_sql('Select sum(total_dias_trab) from trabalhados where professor_id = '+$professor)
    return @soma_dias
  end

  def nome_professor
    $professor = params[:professor_professor_id]
    @professors = Professor.find(:all, :conditions => ['id=' + $professor ])
    #render :partial => 'lista_professor'
    render :update do |page|
      page.replace_html 'titula', :text => ''
      page.replace_html 'dados_professor', :partial => 'lista_professor'
    end

  end
def consulta
    render :partial => 'consultas'
  end


  def lista_participante
    $participante = params[:participante_participante_id]
    @participantes = Participante.find(:all, :conditions => ['id=' + $participante ])
    render :partial => 'lista_participantes'
  end
end
