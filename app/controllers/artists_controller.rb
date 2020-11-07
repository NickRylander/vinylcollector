class ArtistsController < ApplicationController
    before_action :current_artist, only: [:show, :edit, :update, :destroy]
    before_action :please_sign_in
    
    def index
        @artists = Artist.all
    end

    def new 
        @artist = Artist.new
    end

    def create
        @artist = Artist.new(artist_params)
        if @artist.save
            redirect_to @artist
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        @artist.update(artist_params)
        if @artist.valid?
            redirect_to @artist
        else
            render :edit
        end
    end

    def destroy
        @artist.destroy

        redirect_to artists_path
    end

    private

    def artist_params
        params.require(:artist).permit(:name)
    end

    def current_artist
        @artist = Artist.find_by_id(params[:id])
    end

    def please_sign_in
        if !user_signed_in?
            redirect_to new_user_registration_path
        end
    end
end
