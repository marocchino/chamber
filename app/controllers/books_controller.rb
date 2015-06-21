class BooksController < ApplicationController
  before_action :set_book, only: %i(show edit update destroy)

  # GET /books
  # GET /books.xml
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.xml
  def show
  end

  # GET /books/new
  # GET /books/new.xml
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.xml
  def create
    if @book.save
      redirect_to(books_url)
    else
      render action: 'new'
    end
  end

  # PUT /books/1
  # PUT /books/1.xml
  def update
    if @book.update_attributes(book_params)
      redirect_to(books_url)
    else
      render action: 'edit'
    end
  end

  # DELETE /books/1
  # DELETE /books/1.xml
  def destroy
    @book.destroy
    redirect_to(books_url)
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params[:book]
  end
end
