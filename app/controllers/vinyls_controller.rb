class VinylsController < ApplicationController
    before_action :current_vinyl, only: [:show, :edit, :update, :destroy]

    def index
        @vinyls = Vinyl.all
    end

    def new 
        @artist = Artist.find(params[:artist_id])
        @vinyl = Vinyl.new
    end

    def create
        vinyl = current_user.vinyls.build(vinyl_params)
        # binding.pry
        vinyl.save
        redirect_to new_vinyl_song_path(vinyl)
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
        @vinyl.destroy

        redirect_to vinyls_path
    end

    private

    def vinyl_params
        params.require(:vinyl).permit(:title, :vinyl_size, :user_id, :artist_id, :song_attributes)
    end

    def current_vinyl
        @vinyl = Vinyl.find_by_id(params[:id])
    end

end
