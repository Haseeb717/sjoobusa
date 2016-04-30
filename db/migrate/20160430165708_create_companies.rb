class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :trade
      t.string :cnpj
      t.string :state_identification
      t.string :area
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
