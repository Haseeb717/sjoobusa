class RemoveUnjustifiedAbsencesFromFeedbacks < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :unjustified_absences, :integer
  end
end
