class Passenger < ApplicationRecord
  belongs_to :ticket, foreign_key: "ticket_id"

  def self.ransackable_attributes(auth_object = nil)
    ["age", "created_at", "gender", "id", "mobile", "name", "ticket_id", "updated_at"]
  end

end
