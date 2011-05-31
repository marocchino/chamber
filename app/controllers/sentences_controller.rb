class SentencesController < ApplicationController
  # GET /sentences
  # GET /sentences.xml
  def index
    @sentences = Sentence.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sentences }
    end
  end

  # GET /sentences/1
  # GET /sentences/1.xml
  def show
    @sentence = Sentence.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @sentence }
    end
  end

  # GET /sentences/new
  # GET /sentences/new.xml
  def new
    @sentence = Sentence.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @sentence }
    end
  end

  # GET /sentences/1/edit
  def edit
    @sentence = Sentence.find(params[:id])
  end

  # POST /sentences
  # POST /sentences.xml
  def create
    @sentence = Sentence.new(params[:sentence])

    respond_to do |format|
      if @sentence.save
        format.html { redirect_to(@sentence, :notice => 'Sentence was successfully created.') }
        format.xml  { render :xml => @sentence, :status => :created, :location => @sentence }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @sentence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sentences/1
  # PUT /sentences/1.xml
  def update
    @sentence = Sentence.find(params[:id])

    respond_to do |format|
      if @sentence.update_attributes(params[:sentence])
        format.html { redirect_to(@sentence, :notice => 'Sentence was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @sentence.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sentences/1
  # DELETE /sentences/1.xml
  def destroy
    @sentence = Sentence.find(params[:id])
    @sentence.destroy

    respond_to do |format|
      format.html { redirect_to(sentences_url) }
      format.xml  { head :ok }
    end
  end
end
