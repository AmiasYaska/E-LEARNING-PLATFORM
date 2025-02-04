class VideosController < ApplicationController
  def index
    if params[:search].present? 
      @videos = Video.search(params[:search])     
    else
      @videos = Video.all
    end
  end

  def show
    @video = Video.find(params.expect(:id))
  end

  def autocomplete
    suggestions = Video.autocomplete_search(params[:query])
    render json: suggestions
  end
end
