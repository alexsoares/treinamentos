class ProfessorsController < ApplicationController
  # GET /professors
  # GET /professors.xml
  layout "gerenciar"
  before_filter :load_unidades
  before_filter :load_professors

  def load_professors
    @professors = Professor.find(:all, :order => 'nome ASC')
  end

  def load_unidades
    @unidades = Unidade.find(:all, :order => 'nome ASC')
  end

  def index
    if (params[:search].nil? || params[:search].empty?)
      @professors = Professor.find(:all, :order => 'nome ASC')
    else
      @professors = Professor.find(:all, :conditions => (["nome like ?", "%" + params[:search].to_s + "%" ]), :order => 'nome ASC')
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @professors }
    end
  end

  # GET /professors/1
  # GET /professors/1.xml
  def show
    @professor = Professor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @professor }
    end
  end

  # GET /professors/new
  # GET /professors/new.xml
  def new
    @professor = Professor.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @professor }
    end
  end

  # GET /professors/1/edit
  def edit
    @professor = Professor.find(params[:id])
  end

  # POST /professors
  # POST /professors.xml
  def create
    @professor = Professor.new(params[:professor])

    respond_to do |format|
      if @professor.save
        flash[:notice] = 'Professor was successfully created.'
        format.html { redirect_to(@professor) }
        format.xml  { render :xml => @professor, :status => :created, :location => @professor }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @professor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /professors/1
  # PUT /professors/1.xml
  def update
    @professor = Professor.find(params[:id])

    respond_to do |format|
      if @professor.update_attributes(params[:professor])
        flash[:notice] = 'Professor was successfully updated.'
        format.html { redirect_to(@professor) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @professor.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.xml
  def destroy
    @professor = Professor.find(params[:id])
    @professor.destroy

    respond_to do |format|
      format.html { redirect_to(professors_url) }
      format.xml  { head :ok }
    end
  end
  
    def lista_professor
    $professor = params[:professor_professor_id]
    @professors = Professor.find(:all, :conditions => ['id=' + $professor ])
    render :partial => 'lista_professor'
  end

 def consulta
    render :partial => 'consultas'
  end
end
