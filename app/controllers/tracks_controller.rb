class TracksController < ApplicationController

  def new
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to track_url(@track)
    else
      fail
      flash[:errors] = @track.errors.full_messages
      redirect_to new_band_url
    end
  end

  def show
    @track = Track.find_by(id: params[:id])

    if @track
      render :show
    else
      flash[:errors] = "Track does not exist"
      redirect_to bands_url
    end
  end

  def edit
    @track = Track.find_by(id: params[:id])

    render :edit

  end

  def update
    @track = Track.find_by(id: params[:id])

    if @track.update(track_params)
      redirect_to band_url(@track)
    else
      redirect_to bands_url
    end
  end

  def destroy
    @track = Track.find_by(id: params[:id])
    @track.destroy
    redirect_to bands_url
  end

  private
  def track_params
    params.require(:track).permit(:title, :classification, :lyrics, :album_id)
  end

end
