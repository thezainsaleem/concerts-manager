module APi
  module V1
    class Api::V1::ArtistsController < ApplicationController
      before_action :artist_params, only: [:create, :update]

      def show
        @artist = Artist.find(params["id"])
        render json: @artist.to_json
      end
    
      def index
        @artists = Artist.page(params[:page].to_i || 1)
        render json: { artists: @artists.map{ |artist| artist.to_json }, page: @artists.current_page, total_pages: @artists.total_pages }
      end
    
      def create
        @artist = Artist.create(artist_params)
        if @artist.valid?
          render json: @artist.to_json
        else
          render json: { errors: @artist.errors.full_messages }
        end
      end
    
      def update
        @artist = Artist.find(params["id"])
        @artist.update(artist_params)
        if @artist.valid?
          render json: @artist.to_json
        else
          render json: { errors: @artist.errors.full_messages }
        end
      end
    
      def destroy
        @artist = Artist.find(params["id"])
        not_found unless @artist
        @artist.destroy
        render json: @artist.to_json
      end

      def artist_params
        params.require(:artist).permit(:name, :image)

      end
    
    end   
  end
end
