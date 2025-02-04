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

  
end
