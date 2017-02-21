class GifsController < ApplicationController
  before_action :authorize!, only: [:new, :create]

  def new
    @gif = Gif.new
  end

  def index
    @gifs = Gif.all
  end

  def show
    @gif = Gif.find(params[:id])
  end

  def create
    @gif = Gif.new(gif_params)
    if @gif.save
      redirect_to gifs_path
    else
      render :new
    end
  end

  def favorite
    gif = Gif.find(params[:id])
    current_user.gifs << gif
    redirect_to gif_path(gif), notice: "You favorited #{gif.title}"
  end

private

  def gif_params
    params.require(:gif).permit(:image_path, :title)
  end

end
