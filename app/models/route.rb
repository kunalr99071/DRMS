class Route < ApplicationRecord
  has_many :stations
  has_many :tickets

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "name", "updated_at"]
  end
end
