class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movie = @list.movies
    @bookmarks = @list.bookmarks
    end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save # W
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
