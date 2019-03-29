class V1::SpacesController < ApplicationController
  before_action :set_space, only: [:show, :update, :destroy]
  
   # GET /v1/spaces
  def index
    spaces = Space.all
    render json: spaces
  end

 

  #POST /v1/spaces
  def create 
    space = Space.new(space_params)
    if space.save
      render status: 201, json: {
        message: "Space successfully added",
        data: space
      }
    else 
      render status: 422, json: {
        message: "Space not added"
      }
    end
  end

    # GET /v1/spaces/:id
    def show 
      render json: @space
    end 

    #PUT request - should always return an empty json
    def update
      @space.update(space_params)
      head :no_content
    end 
 
  private 

    def space_params
      params.permit(:name, :city, :address, :postcode, :price)
    end 

    def set_space
      @space = Space.find(params[:id])
    end 

  end 

