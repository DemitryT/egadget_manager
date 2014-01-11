class Gadget < ActiveRecord::Base
  attr_accessible :name, :quantity, :manufacturer, :date_purchased, :user_id

  validates :name, presence: true
  validates :quantity, presence: true

  class << self
    def belonging_to(current_user_id)
      where(user_id: current_user_id)
    end
  end
end
