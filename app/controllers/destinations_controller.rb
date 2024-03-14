class DestinationsController < ApplicationController
  
  before_action :authenticate_user!, only: [:index]

  def index
    if params[:destination_id].present?
      
      @destinations = [Destination.find(params[:destination_id])]
    else
      @destinations = Destination.all
    end
  end

 
end

