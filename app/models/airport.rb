class Airport < ActiveRecord::Base
  attr_accessible :city, :code, :country, :details, :latitude, :longitude, :name

  has_one :location

  validates :code, uniqueness: true
  validates :code, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :details, presence: true


  def self.search(search)
    search_condition = '%' + search + '%'
    where('city LIKE ? OR code LIKE ? OR country LIKE ?',
     search_condition.titleize, search_condition.upcase, search_condition.titleize)
  end

  before_save do |a|
    # if a.country == "usa"
    #   a.country = a.country.upcase
    # else
    a.city = a.city.downcase.titleize
    a.country = a.country.downcase.titleize
    a.code = a.code.upcase
    # end
  end

  before_update do |b|
    b.city = b.city.downcase.titleize
    b.country = b.country.downcase.titleize
    b.code = b.code.upcase
  end

end

