

class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to artist_path(@artist)
  end

  def show
    # binding.pry
    @artist = Artist.find_by(params[:id])
    # @artist = Artist.find_by(artist_params)

  end

  def edit
    get_artist
  end

  def update
    get_artist
    @artist.update(artist_params)
    @artist.save
    redirect_to artist_path(@artist)
  end

  def delete
    get_artist
    @artist.delete
    redirect_to artist_path
  end
# cd desktop/flatiron-online/rails-cru-form_for-lab-v-000
  private

    def artist_params(*args)
      # binding.pry
      params.require(:artist).permit(:name, :bio)
    end

    def get_artist
      @artist = Artist.find_by(params[:id])
    end


end
