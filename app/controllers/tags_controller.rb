class TagsController < ApplicationController
  def show
  end
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tags_params)
    redirect_to new_book_path
  end

  private

  def tags_params
    params.require(:tag).permit(:name)
  end
end
