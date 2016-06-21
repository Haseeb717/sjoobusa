class RemoveCustomerServiceScoreFromFeedbacks < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :customer_service_score, :integer
  end
end
