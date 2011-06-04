class SentencesController < ApplicationController
  expose(:book)
  expose(:chapters) { book.chapters.all }
  expose(:chapter)
  expose(:sentences) { chapter.sentences.all }
  expose(:sentence)
  # GET /sentences
  # GET /sentences.xml
  def index
  end

  # GET /sentences/1
  # GET /sentences/1.xml
  def show
  end

  # GET /sentences/new
  # GET /sentences/new.xml
  def new
  end

  # GET /sentences/1/edit
  def edit
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
    respond_to do |format|
      if sentence.update_attributes(params[:sentence])
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
    sentence.destroy
    redirect_to book_chapter_sentences_path(book, chapter)
  aend
end
