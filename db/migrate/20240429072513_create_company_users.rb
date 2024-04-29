class CreateCompanyUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :company_users do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.boolean :active

      t.timestamps
    end
  end
end
