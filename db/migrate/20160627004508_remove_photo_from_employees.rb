class RemovePhotoFromEmployees < ActiveRecord::Migration
  def change
    remove_column :employees, :photo, :string
  end
end
