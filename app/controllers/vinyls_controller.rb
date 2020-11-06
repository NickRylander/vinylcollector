class VinylsController < ApplicationController
    before_action :current_vinyl, only: [:show, :edit, :update, :destroy]
    
    def index
        @vinyls = Vinyl.all
    end

    def new 
        @vinyl = Vinyl.new
    end

    def create
        @vinyl = Vinyl.new(vinyl_params)
        # binding.pry
        if @vinyl.save
            redirect_to @vinyl
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
end
