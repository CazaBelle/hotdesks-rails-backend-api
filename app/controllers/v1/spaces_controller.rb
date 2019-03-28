class V1::SpacesController < ApplicationController
  
  def index
    spaces = Space.all
    render json: spaces
  end
  
  private 

  def space_params
    params.perit(:name, :city, :address, :postcode, :price)
  end 
  
end
