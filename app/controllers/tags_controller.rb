class TagsController < ApplicationController
  def index
  end

  def show
    @book = Book.find(params[:book_id])
  end
  def new
    @tag = Tag.new
  end

  def create
    @book = Book.find(params[:book_id])
    @tag = Tag.create(name: tags_params[:name])
    redirect_to book_path(@book)
  end

  private

  def tags_params
    params.require(:tag).permit(:name)
  end
end
