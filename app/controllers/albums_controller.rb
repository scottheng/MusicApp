class AlbumsController < ApplicationController

def new
  render :new
end

def create
  @album = Album.new(album_params)

  if @album.save
    redirect_to album_url(@album)
  else
    fail
    flash[:errors] = @album.errors.full_messages
    redirect_to new_band_url
  end
end

def show
  @album = Album.find_by(id: params[:id])

  if @album
    render :show
  else
    flash[:errors] = "Album does not exist"
    redirect_to bands_url
  end
end

def edit
  @album = Album.find_by(id: params[:id])

  render :edit

end

def update
  @album = Album.find_by(id: params[:id])

  if @album.update(album_params)
    redirect_to band_url(@album)
  else
    redirect_to bands_url
  end
end

def destroy
  @album = Album.find_by(id: params[:id])
  @album.destroy
  redirect_to bands_url
end

private
def album_params
  params.require(:album).permit(:title, :year, :genre, :category, :band_id)
end

end
