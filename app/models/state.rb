class State < ActiveRecord::Base
  has_many :cities
  attr_accessible :name, :uf

  def self.names_with_ids
    self.order("name ASC").map {|c| [c.name, c.id]}
  end
end
