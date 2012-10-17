class State < ActiveRecord::Base
  has_many :cities
  attr_accessible :name, :uf
end
