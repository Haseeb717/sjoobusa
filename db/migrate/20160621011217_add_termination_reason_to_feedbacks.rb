class AddTerminationReasonToFeedbacks < ActiveRecord::Migration
  def change
    add_column :feedbacks, :termination_reason, :integer
  end
end
