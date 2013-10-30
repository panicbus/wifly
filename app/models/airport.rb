class Airport < ActiveRecord::Base
  attr_accessible :city, :code, :country, :details, :latitude, :longitude

  has_one :location

  validates :code, uniqueness: true
  validates :code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :details, presence: true

  def self.search(search)
    search_condition = '%' + search + '%'
    where('city LIKE ? OR code LIKE ? OR country LIKE ?',
     search_condition, search_condition, search_condition)
  end

end

