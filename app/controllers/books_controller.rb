class BooksController < ApplicationController

    def get_img_url
        # byebug
        @book = GoogleBooks.find_img_url(params[:find_titles_path, :find_authors_titles_path])
        render :show_img_url
    end

    def show_img_url

    end

    def find_titles
        #byebug
        @books = GoogleBooks.find_book_title(params[:book][:find_titles_path])
        render :show_titles
    end

    def show_titles

    end

    def find_authors_titles
        #byebug
        @books = GoogleBooks.find_author_name_books(params[:book][:find_authors_titles_path])
        render :show_authors_titles
    end

    def show_authors_titles

    end
    
    def index
        @books = Book.all
    end
    
    def show
        @book = Book.find(params[:id])
    end

    def new
        #byebug
        @book = Book.new
        @book_info = params[:book]
    end

    def create
        @book = Book.new(book_params)
        if @book.save 
            redirect_to books_path
        else
            flash[:message] = @book.errors.full_messages
            redirect_to new_book_path
        end
    end

    def edit
        @book = Book.find(params[:id])
    end
    def update
        # byebug
        @book = Book.find(params[:id])
        @book.update(book_params)
        # byebug
        
        redirect_to book_path(@book)
    end

    # def list_reviews
    #     @book = Book.find(params[:id])
    # end

    # def create_reviews
    #     @book = Book.find(params[:id])
    #     @review = Review.create(content:reviews_params[:content], book_id:params[:book_id], user_id:session[:user_id])
    #     redirect_to book_path(@book)
    #     # @review = Review.create(content:reviews_path[:content])
    #     # redirect_to "/books/#{book.id}/reviews"
    # end

    def destroy
        @book = Book.find_by(id: params[:id])
        @book.destroy
        redirect_to user_path(session[:user_id]), success: "#{@book.title} was removed from your list."
    end

    private

    def book_params
        params.require(:book).permit(:title, :author, :image_url, tag_ids:[])
        
    end

   
end
