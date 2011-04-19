class UnidadesController < ApplicationController
  # GET /unidades
  # GET /unidades.xml
  def index
    @unidades = Unidades.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unidades }
    end
  end

  # GET /unidades/1
  # GET /unidades/1.xml
  def show
    @unidades = Unidades.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @unidades }
    end
  end

  # GET /unidades/new
  # GET /unidades/new.xml
  def new
    @unidades = Unidades.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @unidades }
    end
  end

  # GET /unidades/1/edit
  def edit
    @unidades = Unidades.find(params[:id])
  end

  # POST /unidades
  # POST /unidades.xml
  def create
    @unidades = Unidades.new(params[:unidades])

    respond_to do |format|
      if @unidades.save
        flash[:notice] = 'Unidades was successfully created.'
        format.html { redirect_to(@unidades) }
        format.xml  { render :xml => @unidades, :status => :created, :location => @unidades }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @unidades.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /unidades/1
  # PUT /unidades/1.xml
  def update
    @unidades = Unidades.find(params[:id])

    respond_to do |format|
      if @unidades.update_attributes(params[:unidades])
        flash[:notice] = 'Unidades was successfully updated.'
        format.html { redirect_to(@unidades) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unidades.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /unidades/1
  # DELETE /unidades/1.xml
  def destroy
    @unidades = Unidades.find(params[:id])
    @unidades.destroy

    respond_to do |format|
      format.html { redirect_to(unidades_url) }
      format.xml  { head :ok }
    end
  end
end
