class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :company, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.string :service_type
      t.string :role
      t.date :start_at
      t.date :end_at
      t.integer :commitment_score
      t.integer :excellence_score
      t.integer :productivity_score
      t.integer :customer_service_score
      t.integer :leadership_score
      t.integer :proactivity_score
      t.integer :teamwork_score
      t.integer :flexibility_score
      t.decimal :contribution_to_sales
      t.integer :unjustified_absences
      t.integer :warnings
      t.integer :late_for_work

      t.timestamps null: false
    end
  end
end
