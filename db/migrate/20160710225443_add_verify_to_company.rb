class AddVerifyToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :verify, :boolean,:default=>false
    add_column :companies, :block, :boolean,:default=>false
  end
end
