class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new

    end

    def create
        @song = Song.new(song_params)

        if @song.save
            redirect_to song_path(@song)
        else
            # flash[:errors] = @song.errors.messages
            render :new
        end
    end

    def show
        @song = Song.find(params[:id])
        @title = @song.title
        @artist_name = @song.artist_name
        @genre = @song.genre
        @released_year = @song.released
        @release_year = @song.release_year if @released

    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.find(params[:id])
        @song.update(song_params)

        if @song.valid?
          
            redirect_to song_path(@song)
        else  
            
            render :edit
        end
        
    end

    def destroy
        Song.destroy(params[:id])
        redirect_to songs_path
    end

    private

    def song_params
        params.require(:song).permit(:title, :artist_name, :genre, :released, :release_year)
    end
end
