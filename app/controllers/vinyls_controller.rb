class VinylsController < ApplicationController
    before_action :current_vinyl, only: [:show, :edit, :update, :destroy]
    before_action :please_sign_in

    def index
        @vinyls = Vinyl.all
    end

    def new 
        @artist = Artist.find_by_id(params[:artist_id])
        @vinyl = @artist.vinyls.build
    end

    def create
        @artist = Artist.find_by_id(params[:artist_id])
        @vinyl = @artist.vinyls.build(vinyl_params)
        @vinyl.user_id = current_user.id
        if @vinyl.save
            redirect_to new_vinyl_song_path(@vinyl)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        @vinyl.update(vinyl_params)
        if @vinyl.valid?
            redirect_to @vinyl
        else
            render :edit
        end
    end

    def destroy
        @vinyl.songs.destroy_all
        @vinyl.destroy
        redirect_to vinyls_path
    end

    private

    def vinyl_params
        params.require(:vinyl).permit(:title, :vinyl_size, :user_id, :artist_id)
    end

    def current_vinyl
        @vinyl = Vinyl.find_by_id(params[:id])
    end

    def please_sign_in
        if !user_signed_in?
            redirect_to new_user_registration_path, notice: "Please Sign In"
        end
    end
end