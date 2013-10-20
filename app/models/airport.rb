class Airport < ActiveRecord::Base
  attr_accessible :city, :code, :country, :details

  def self.search(search)
    search_condition = "%" + search + "%" + search + "%"
    find(:all, :conditions => ['city LIKE ? OR airport_code LIKE ? OR country LIKE ?',
      search_condition, search_condition, search_condition])
  end


end
