class CompanyUser < ApplicationRecord
  belongs_to :company
  has_many :roles

  def self.ransackable_attributes(auth_object = nil)
    ["active", "company_id", "created_at", "id", "id_value", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["company", "roles"]
  end
end
