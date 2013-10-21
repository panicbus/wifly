class Airport < ActiveRecord::Base
  attr_accessible :city, :code, :country, :details

  def self.search(search)
    search_condition = '%' + search + '%'
    where('city LIKE ? OR code LIKE ? OR country LIKE ?',
     search_condition, search_condition, search_condition)
  end

  # def

  # end

end
