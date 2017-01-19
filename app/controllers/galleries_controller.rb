class GalleriesController < ApplicationController

  def index
    @galls = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    respond_to do |format|
      if @gallery.save
        format.html {redirect_to welcome_index_path}
      else
        format.html {redirect_to welcome_index_path}
      end
    end

  end

  private
  def gallery_params
    params.require(:gallery).permit(:year, {avatars: []})
  end
end
