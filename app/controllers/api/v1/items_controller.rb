class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    if item.save
      render status: :created, json: item
    else
      render status: 500, json: "Some error occurred"
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      render status: :no_content, json: "Item deleted" 
    else
      render status: :internal_service_error, json: "Some error occurred"
    end
  end

  private
    def item_params
      params.require('item').permit('name', 'description', 'image_url')
    end
end
