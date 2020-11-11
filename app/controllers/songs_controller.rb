class SongsController < ApplicationController
    before_action :current_song, only: [:show, :edit, :update, :destroy]
    before_action :please_sign_in

    def index
        @vinyl = Vinyl.find_by_id(params[:vinyl_id])
        if params[:vinyl_id]
            @songs = Vinyl.find_by_id(params[:vinyl_id]).songs
          else
            @songs = Song.all
          end
        @long_song = Vinyl.find_by_id(params[:vinyl_id]).songs.longest_song
    end

    def new 
        @vinyl = Vinyl.find_by_id(params[:vinyl_id])
        @song = @vinyl.songs.build
    end

    def create
        @vinyl = Vinyl.find_by_id(params[:vinyl_id])
        @song = @vinyl.songs.build(song_params)
        if @song.save
            redirect_to vinyl_songs_path(@vinyl)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        @song.update(song_params)
        if @song.valid?
            redirect_to @song
        else
            render :edit
        end
    end

    def destroy
        redirect_to vinyl_path(@song.vinyl_id)
        @song.destroy
    end

    private

    def song_params
        params.require(:song).permit(:title, :duration, :vinyl_id)
    end

    def current_song
        @song = Song.find_by_id(params[:id])
    end

    def please_sign_in
        if !user_signed_in?
            redirect_to new_user_registration_path
        end
    end
end
