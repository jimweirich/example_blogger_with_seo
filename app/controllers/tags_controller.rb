class TagsController < ApplicationController
  def index
    @tags = Tag.all_tags
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    Tag.delete(params[:id])
    redirect_to tags_path
  end
end
