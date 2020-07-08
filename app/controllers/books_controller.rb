class BooksController < ApplicationController

    def find_titles
        #byebug
        @book = GoogleBooks.find_book_title(params[:book][:find_titles_path])
        render :show_titles
    end

    def show_titles

    end
    
    def index
        @books = Book.all
    end
    
    def show
        @book = Book.find(params[:id])
    end

    def new
        @book = Book.new
    end

    def create
        @book = Book.new(book_params)
        if @book.save 
            redirect_to book_path(@book)
          else
            flash[:message] = @book.errors.full_messages
            redirect_to new_book_path
          end
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :image_url, :user_id, tags_ids:[])
        
    end
end
