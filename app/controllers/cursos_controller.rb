class CursosController < ApplicationController
  # GET /cursos
  # GET /cursos.xml
  before_filter :login_required
  before_filter :load_cursos
  layout "gerenciar"
   def load_cursos
    @cursos = Curso.find(:all, :order => 'nome ASC')
  end

  def index
    @cursos_count = Curso.all
    if (params[:search].nil? || params[:search].empty?)      
      @cursos = Curso.paginate(:all,:page=>params[:page],:per_page =>3)
    else
       @cursos = Curso.find(:all,:page=>params[:page],:per_page => 1, :conditions => ["nome like ?", "%" + params[:search].to_s + "%"], :order => 'nome ASC')
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cursos }
    end
  end

  # GET /cursos/1
  # GET /cursos/1.xml
  def show
    @curso = Curso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @curso }
    end
  end

  # GET /cursos/new
  # GET /cursos/new.xml
  def new
    @curso = Curso.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @curso }
    end
  end

  # GET /cursos/1/edit
  def edit
    @curso = Curso.find(params[:id])
  end

  # POST /cursos
  # POST /cursos.xml
  def create
    @curso = Curso.new(params[:curso])

    respond_to do |format|
      if @curso.save
        flash[:notice] = 'CURSO CADASTRADO COM SUCESSO.'
        format.html { redirect_to(@curso) }
        format.xml  { render :xml => @curso, :status => :created, :location => @curso }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @curso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cursos/1
  # PUT /cursos/1.xml
  def update
    @curso = Curso.find(params[:id])

    respond_to do |format|
      if @curso.update_attributes(params[:curso])
        flash[:notice] = 'CURSO ATUALIZADO COM SUCESSO'
        format.html { redirect_to(@curso) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @curso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.xml
  def destroy
    @curso = Curso.find(params[:id])
    @curso.destroy

    respond_to do |format|
      format.html { redirect_to(cursos_url) }
      format.xml  { head :ok }
    end
  end

 def consulta
    render :partial => 'consultas'
  end


  def lista_curso
    $curso = params[:curso_curso_id]
    @cursos = Curso.find(:all, :conditions => ['id=' + $curso ])
    render :partial => 'lista_cursos'
  end

   def mesmo_nome
    $nome = params[:curso_nome]
    @verifica = Curso.find_by_nome($nome)
    if @verifica then
      render :update do |page|
        page.replace_html 'nome_aviso', :text => 'CURSO JÁ CADASTRADO NO SISTEMA'
        page.replace_html 'Certeza', :text => "CURSO JÁ CADASTRADO NO SISTEMA"
    end
    else
      render :update do |page|
        page.replace_html 'nome_aviso', :text => ''
      end

    end
  end

   	
end
