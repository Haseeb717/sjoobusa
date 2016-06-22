class RemoveLateForWorkFromFeedbacks < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :late_for_work, :integer
  end
end
