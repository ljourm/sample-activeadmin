# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

return unless Rails.env.development? # development環境以外では実行しない
return if AdminUser.exists? # seed実行済みなら終了

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

company1 = Company.create!(name: 'Company 1', code: 'code_1')
company2 = Company.create!(name: 'Company 2', code: 'code_2')

company_user1 = CompanyUser.create!(company: company1, name: 'Company User 1', active: true)
company_user2 = CompanyUser.create!(company: company2, name: 'Company User 2', active: true)

role1 = Role.create!(company_user: company_user1, role_type: 1)
role2 = Role.create!(company_user: company_user2, role_type: 2)
