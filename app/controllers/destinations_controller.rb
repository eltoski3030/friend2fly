class DestinationsController < ApplicationController
  def index
    if params[:destination_id].present?
      # Find and display only the selected destination.
      @destinations = [Destination.find(params[:destination_id])]
    else
      # If no destination is selected, you might want to show all or none.
      @destinations = []
      # Alternatively, to show all destinations when none is selected, use Destination.all
    end
  end
end


