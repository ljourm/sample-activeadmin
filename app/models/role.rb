class Role < ApplicationRecord
  belongs_to :company_user

  def self.ransackable_associations(auth_object = nil)
    ["company_user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["company_user_id", "created_at", "id", "id_value", "role_type", "updated_at"]
  end
end
