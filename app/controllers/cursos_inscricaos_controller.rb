class CursosInscricaosController < ApplicationController
  # GET /cursos_inscricaos
  # GET /cursos_inscricaos.xml
  def index
    @cursos_inscricaos = CursosInscricao.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cursos_inscricaos }
    end
  end

  # GET /cursos_inscricaos/1
  # GET /cursos_inscricaos/1.xml
  def show
    @cursos_inscricao = CursosInscricao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cursos_inscricao }
    end
  end

  # GET /cursos_inscricaos/new
  # GET /cursos_inscricaos/new.xml
  def new
    @cursos_inscricao = CursosInscricao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cursos_inscricao }
    end
  end

  # GET /cursos_inscricaos/1/edit
  def edit
    @cursos_inscricao = CursosInscricao.find(params[:id])
  end

  # POST /cursos_inscricaos
  # POST /cursos_inscricaos.xml
  def create
    @cursos_inscricao = CursosInscricao.new(params[:cursos_inscricao])

    respond_to do |format|
      if @cursos_inscricao.save
        flash[:notice] = 'CursosInscricao was successfully created.'
        format.html { redirect_to(@cursos_inscricao) }
        format.xml  { render :xml => @cursos_inscricao, :status => :created, :location => @cursos_inscricao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cursos_inscricao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cursos_inscricaos/1
  # PUT /cursos_inscricaos/1.xml
  def update
    @cursos_inscricao = CursosInscricao.find(params[:id])

    respond_to do |format|
      if @cursos_inscricao.update_attributes(params[:cursos_inscricao])
        flash[:notice] = 'CursosInscricao was successfully updated.'
        format.html { redirect_to(@cursos_inscricao) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cursos_inscricao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos_inscricaos/1
  # DELETE /cursos_inscricaos/1.xml
  def destroy
    @cursos_inscricao = CursosInscricao.find(params[:id])
    @cursos_inscricao.destroy

    respond_to do |format|
      format.html { redirect_to(cursos_inscricaos_url) }
      format.xml  { head :ok }
    end
  end
end
