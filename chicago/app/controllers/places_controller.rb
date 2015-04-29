class PlacesController < ApplicationController

  def index
   @places = Place.order('title asc')
  end

  def show
    @place = Place.find(params[:id])
    
    if @place == nil
    	redirect_to places_url
    end
  end

  def new
  end

  def create
    Place.create title: params[:title],
                 price: (params[:price].to_f * 100).to_i,
                 photo_url: params[:url],
                 desc: params[:desc]

    redirect_to places_url
  end

  def edit
  	@place = Place.find_by(id: params["id"])
  end
	
  def update
    @place = Place.find(params[:id])
    @place.update title: params[:title],
                  price: (params[:price].to_f * 100).to_i,
                  photo_url: params[:url],
                  desc: params[:desc]
                  
    redirect_to place_url(@place.id)
  end
  
  def delete
    @place = Place.find_by(id: params["id"])
    @place.delete
    redirect_to places_url
  end

end
