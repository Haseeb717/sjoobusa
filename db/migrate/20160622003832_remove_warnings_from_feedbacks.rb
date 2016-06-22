class RemoveWarningsFromFeedbacks < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :warnings, :integer
  end
end
