class Cities < ActiveRecord::Base
  belongs_to :state
  attr_accessible :name, :state
end
