class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def update
    
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      render status: 204
    else
      render status: 500
    end
  end

end
