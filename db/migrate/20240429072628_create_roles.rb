class CreateRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :roles do |t|
      t.references :company_user, null: false, foreign_key: true
      t.integer :role_type

      t.timestamps
    end
  end
end
