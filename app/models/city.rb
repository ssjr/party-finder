class City < ActiveRecord::Base
  belongs_to :state
  attr_accessible :name, :state

  def self.names_with_ids(state_id)
    self.where(state_id: state_id).order("name ASC").map {|c| [c.name, c.id]}
  end
end
