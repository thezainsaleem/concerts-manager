module APi
  module V1
    class Api::V1::LocalitiesController < ApplicationController
      before_action :locality_params, only: [:create, :update]

      def show
        @locality = Locality.find(params["id"])
        render json: @locality
      end
    
      def index
        @localities = Locality.page(params[:page].to_i || 1)
        render json: { localities: @localities, page: @localities.current_page, total_pages: @localities.total_pages }
      end
    
      def create
        @locality = Locality.create(locality_params)
        if @locality.valid?
          render json: @locality
        else
          render json: { errors: @locality.errors.full_messages }
        end
      end
    
      def update
        @locality = Locality.find(params["id"])
        @locality.update(locality_params)
        if @locality.valid?
          render json: @locality
        else
          render json: { errors: @locality.errors.full_messages }
        end
      end
    
      def destroy
        @locality = Locality.find(params["id"])
        not_found unless @locality
        @locality.destroy
        render json: @locality
      end

      def locality_params
        params.require(:locality).permit(:name, :address)

      end
    
    end   
  end
end
