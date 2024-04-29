class Company < ApplicationRecord
  has_many :company_users

  def self.ransackable_attributes(auth_object = nil)
    ["code", "created_at", "id", "id_value", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["company_users"]
  end
end
