class Gadget < ActiveRecord::Base
  attr_accessible :name, :quantity, :manufacturer, :date_purchased, :user_id, :photos_attributes

  validates :name, presence: true
  validates :quantity, presence: true

  belongs_to :user
  has_many :photos, dependent: :destroy

  accepts_nested_attributes_for :photos, allow_destroy: true

  def self.ransackable_attributes(auth_object = nil)
    ['name', 'manufacturer', 'date_purchased']
  end

  class << self
    def belonging_to(current_user_id)
      where(user_id: current_user_id)
    end
  end
end
