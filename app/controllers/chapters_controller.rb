class ChaptersController < ApplicationController
  expose(:book)
  expose(:chapters) { book.chapters.all }
  expose(:chapter)
  before_filter :assciation_bulder, :only => [:create, :update]
  # GET /chapters
  # GET /chapters.xml
  def index
  end

  # GET /chapters/1
  # GET /chapters/1.xml
  def show
  end

  # GET /chapters/new
  # GET /chapters/new.xml
  def new
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  # POST /chapters.xml
  def create
    if chapter.save
      redirect_to(book_chapter_sentences_path(book,chapter), :notice => 'Chapter was successfully created.')
    else
      render :action => "new"
    end
  end

  # PUT /chapters/1
  # PUT /chapters/1.xml
  def update
    debugger
    chapter.book = book
    if chapter.save
      redirect_to(book_chapter_path([book, chapter]), :notice => 'Chapter was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.xml
  def destroy
    chapter.destroy
    redirect_to book_chapters_path(book)
  end

  private
  def assciation_bulder
  end
end
