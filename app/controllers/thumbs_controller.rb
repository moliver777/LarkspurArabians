class ThumbsController < ApplicationController
  # GET /thumbs
  # GET /thumbs.json
  def index
    @thumbs = Thumb.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @thumbs }
    end
  end

  # GET /thumbs/1
  # GET /thumbs/1.json
  def show
    @thumb = Thumb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @thumb }
    end
  end

  # GET /thumbs/new
  # GET /thumbs/new.json
  def new
    @thumb = Thumb.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @thumb }
    end
  end

  # GET /thumbs/1/edit
  def edit
    @thumb = Thumb.find(params[:id])
  end

  # POST /thumbs
  # POST /thumbs.json
  def create
    @thumb = Thumb.new(params[:thumb])

    respond_to do |format|
      if @thumb.save
        format.html { redirect_to @thumb, :notice => 'Thumb was successfully created.' }
        format.json { render :json => @thumb, :status => :created, :location => @thumb }
      else
        format.html { render :action => "new" }
        format.json { render :json => @thumb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /thumbs/1
  # PUT /thumbs/1.json
  def update
    @thumb = Thumb.find(params[:id])

    respond_to do |format|
      if @thumb.update_attributes(params[:thumb])
        format.html { redirect_to @thumb, :notice => 'Thumb was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @thumb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /thumbs/1
  # DELETE /thumbs/1.json
  def destroy
    @thumb = Thumb.find(params[:id])
    @thumb.destroy

    respond_to do |format|
      format.html { redirect_to thumbs_url }
      format.json { head :ok }
    end
  end
end
