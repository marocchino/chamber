class BooksController < ApplicationController
  expose(:books) { Book.all }
  expose :book

  # GET /books
  # GET /books.xml
  def index
  end

  # GET /books/1
  # GET /books/1.xml
  def show
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    book.chapters.build
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.xml
  def create
    if book.save
      redirect_to(books_url)
    else
      render :action => "new"
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    if book.update_attributes(params[:book])
      redirect_to(books_url)
    else
      render :action => "edit"
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    book.destroy
    redirect_to(books_url)
  end
end
