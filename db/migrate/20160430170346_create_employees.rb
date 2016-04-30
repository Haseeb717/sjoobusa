class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :cpf
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps null: false
    end
  end
end
