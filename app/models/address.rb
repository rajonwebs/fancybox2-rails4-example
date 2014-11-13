class Address < ActiveRecord::Base

  validates :name, :street, :city, :state, :zip, presence: true
  validates :name, uniqueness: true, length: {within: 3..35}

end
