class Party < ActiveRecord::Base
  belongs_to :city
  belongs_to :state
  belongs_to :user
  attr_accessible :description, :latitude, :longitude, :name, :start_at, :street, :street_extra, :street_number, :city_id, :user_id

  validates_presence_of :name, :description, :start_at, :street

  validates_each :start_at do |record, attr, value|
    record.errors.add(attr, 'deve ser no futuro.') if value.nil? || value.blank? || (value.past? && record.new_record?)
  end

  geocoded_by :full_street_address
  after_validation :geocode

  scope :future, where("start_at > ?", 10.hours.ago).order("start_at ASC")

  def as_json(options={})
    {
      :id => self.id,
      :name => self.name,
      :description => self.description,
      :latitude => self.latitude,
      :longitude => self.longitude,
      :address =>{
        :street => self.street,
        :number => self.street_number,
        :extra => self.street_extra,
        :city => self.city.name,
        :state => self.state.uf,
      },
      :start_at => self.start_at
    }
  end

  def state
    self.city.state
  end

  def full_street_address
    [street, street_number, city.name, state.uf].compact.join(', ')
  end
end
