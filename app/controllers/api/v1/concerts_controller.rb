module APi
  module V1
    class Api::V1::ConcertsController < ApplicationController
      before_action :concert_params, only: [:create, :update]

      def show
        @concert = Concert.find(params["id"])
        render json: @concert.to_json
      end
    
      def index
        @concerts = Concert.page(params[:page].to_i || 1)
        render json: { concerts: @concerts.map{ |concert| concert.to_json }, page: @concerts.current_page, total_pages: @concerts.total_pages }
      end
    
      def create
        @concert = Concert.create(concert_params)
        if @concert.valid?
          render json: @concert.to_json
        else
          render json: { errors: @concert.errors.full_messages }
        end
      end
    
      def update
        @concert = Concert.find(params["id"])
        @concert.update(concert_params)
        if @concert.valid?
          render json: @concert.to_json
        else
          render json: { errors: @concert.errors.full_messages }
        end
      end
    
      def destroy
        @concert = Concert.find(params["id"])
        @concert.destroy
        render json: @concert.to_json
      end

      def concert_params
        params.require(:concert).permit(:artist_id, :cover_image, :locality_id, :date)

      end
    
    end   
  end
end
