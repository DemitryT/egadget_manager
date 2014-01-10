class Gadget < ActiveRecord::Base
  attr_accessible :name, :quantity, :date_purchased, :user_id

  validates :name, presence: true
  validates :quantity, presence: true
end
