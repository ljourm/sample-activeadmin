class CompanyUser < ApplicationRecord
  belongs_to :company
  has_many :roles
end
