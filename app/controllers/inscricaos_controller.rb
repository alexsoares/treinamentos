class InscricaosController < ApplicationController
  # GET /inscricaos
  # GET /inscricaos.xml
    before_filter :load_cursos
    before_filter :load_participantes
    before_filter :load_inscricaos
    layout 'cadastral'

  def index
    @inscricaos = Inscricao.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inscricaos }
    end

  end

  # GET /inscricaos/1
  # GET /inscricaos/1.xml
  def show
    @inscricao = Inscricao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inscricao }
    end
  end

  # GET /inscricaos/new
  # GET /inscricaos/new.xml
  def new
    @inscricao = Inscricao.find_by_participante_id(params[:participante])
    if @inscricao.present?
      @participante = Participante.find(@inscricao.participante_id)
      redirect_to(edit_inscricao_path(@inscricao))
    else
      @inscricao = Inscricao.new
      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @inscricao }
      end
    end
  end

  # GET /inscricaos/1/edit
  def edit
    @inscricao = Inscricao.find(params[:id])
  end


  def sel_participa
    @dadosparticipa = Participante.find(params[:inscricao_participante_id])
    render :partial => 'exibe_participante'
  end
  # POST /inscricaos
  # POST /inscricaos.xml
  def create
    @inscricao = Inscricao.new(params[:inscricao])
    @inscricao.data_inscricao = Time.now
    respond_to do |format|
      if @inscricao.save
        flash[:notice] = 'INSCRIÇÃO CONFIRMADA COM SUCESSO.'
        format.html { redirect_to(@inscricao) }
        format.xml  { render :xml => @inscricao, :status => :created, :location => @inscricao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inscricao.errors, :status => :unprocessable_entity }
      end

    end
  end

  # PUT /inscricaos/1
  # PUT /inscricaos/1.xml
  def update
    @inscricao = Inscricao.find(params[:id])


    respond_to do |format|
      if @inscricao.update_attributes(params[:inscricao])
        flash[:notice] = 'INSCRIÇÃO ATUALIZADA COM SUCESSO.'
        format.html { redirect_to(@inscricao) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inscricao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inscricaos/1
  # DELETE /inscricaos/1.xml
  def destroy
    @inscricao = Inscricao.find(params[:id])
    @inscricao.destroy

    respond_to do |format|
      format.html { redirect_to(inscricaos_url) }
      format.xml  { head :ok }
    end
  end


 def por_curso
   @search = Inscricao.search(params[:search])
   if (params[:search]).present?
    @curso = @search.paginate(:all,:page=>params[:page],:per_page =>20, :order => sort_column + " " + sort_direction)
   end
   render :action => 'por_curso'
 end


 def lista_inscricao
    $curso = params[:curso_curso_id]
    @inscricaos = Inscricao.find(:all, :conditions => ['curso_id=' + $curso ])
    render :partial => 'lista_inscricao'
 end

 def estatistica
    @cursos = Curso.find(:all, :order => 'nome ASC')
    @inscricaos = Inscricao.all
  end

private

  def sort_column
    Inscricao.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end



protected


  def load_inscricaos
    @inscricaos = Inscricao.find(:all)
  end

  def load_cursos
    @cursos = Curso.find(:all, :order => 'nome ASC')
  end


  def load_participantes
    if params[:participante].present?
      @participante = Participante.find(params[:participante], :order => 'nome ASC')
    else
      @participantes = Participante.find(:all, :order => 'nome ASC')
    end
  end

end
