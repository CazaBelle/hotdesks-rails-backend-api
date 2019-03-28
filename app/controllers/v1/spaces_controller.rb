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
    space = Space.create(space_params)
    render json: space
  end 

  private 

  def space_params
    params.permit(:name, :city, :address, :postcode, :price)
  end 
  
end
