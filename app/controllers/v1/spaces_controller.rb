class V1::SpacesController < ApplicationController
  
  def index
    spaces = Space.all
    render json: spaces
  end

  def show 
    space = Space.find(params[:id])
    render json: space
  end 

  def create 
    space = Space.new(space_params)
    if space.save
      render status: 201, json: {
        message: "Space successfully added",
        data: space
      }
    else 
      render status: 500, json: {
        message: "Space not added"
      }
    end
  end 

  private 

  def space_params
    params.permit(:name, :city, :address, :postcode, :price)
  end 
  
end
