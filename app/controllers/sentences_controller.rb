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
    sentence.chapter = chapter
    if sentence.save
      redirect_to([book,chapter,sentence], :notice => 'Sentence was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /sentences/1
  # PUT /sentences/1.xml
  def update
    if sentence.save
      redirect_to(sentence, :notice => 'Sentence was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /sentences/1
  # DELETE /sentences/1.xml
  def destroy
    sentence.destroy
    redirect_to book_chapter_sentences_path(book, chapter)
  end
end
