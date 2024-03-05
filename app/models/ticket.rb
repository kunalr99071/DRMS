class Ticket < ApplicationRecord 
  belongs_to :route, foreign_key: "route_id"
  has_many :passengers

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "date", "email", "from", "id", "mobile", "route_id", "pnr" ,"to", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["passengers", "route"]
  end
end
