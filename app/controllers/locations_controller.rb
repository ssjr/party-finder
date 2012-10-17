class LocationsController < ApplicationController
  def cities_for
    if params[:state_id].present?
      render json: City.where(state_id: params[:state_id]).order("name ASC").map{|city|
        {id: city.id, name: city.name}
      }, status: 200
    else
      render nothing: true, status: :unprocessable_entity
    end
  end
end
