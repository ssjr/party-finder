class Party < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  attr_accessible :description, :latitude, :longitude, :name, :start_at, :street, :street_extra, :street_number
end
