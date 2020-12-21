class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    
  end
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tags_params)
    redirect_to '/tags'
  end

  private

  def tags_params
    params.require(:tag).permit(:name)
  end
end
