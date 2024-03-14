class DestinationsController < ApplicationController
  
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    if params[:destination_id].present?
      
      @destinations = [Destination.find(params[:destination_id])]
    else
      @destinations = Destination.all
    end
  end
  
  def new
    @destination = Destination.new
  end
#
  def create
    @destination = Destination.new(destination_params)
    if @destination.save
      redirect_to destinations_path, notice: 'Destination successfully added.'
    else
      render :new
    end
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :description)
  end
#
 
end

