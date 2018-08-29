class PoisController < ApplicationController
    def new
        @poi = Poi.new
    end

    def index
        @pois = Poi.all
    end

    def create
        @poi = Poi.new(poi_params)
        if @poi.save
            redirect_to @poi
        else
            render 'new'
        end
    end

    
    
    def by_distance_show
        @poivalidator = PoiValidator.new(
            x: params[:x], y: params[:y], max_dist: params[:max_dist])
        if @poivalidator.valid? 
            x = params[:x].to_i
            y = params[:y].to_i
            max_dist = params[:max_dist].to_i
            @elected_pois = Poi.elect_pois_by_max_dist(x,y,max_dist)
            render 'pois-by-distance-list'
        else
            render 'pois-by-distance'
        end
    end

    def by_distance_search
        @poivalidator = PoiValidator.new
        render 'pois-by-distance'
    end

    def show
        @poi = Poi.find(params[:id])
    end

    def destroy
        @poi = Poi.find(params[:id])
        @poi.destroy

        redirect_to pois_path
    end

    private
        def poi_params
            params.require(:poi).permit(:name, :x, :y)
        end
end
