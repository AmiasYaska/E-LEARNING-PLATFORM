class VideosController < ApplicationController
  def index
    @videos = if params[:search].present? 
      Video.search(params[:search])     
    else
      Video.all
    end
  end

  def show
    @video = Video.find(params.expect(:id))
  end
end
