class Feedback < ActiveRecord::Base
  belongs_to :company
  belongs_to :employee

  validates :service_type, presence: true
  validates :role, presence: true
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :commitment_score, presence: true
  validates :excellence_score, presence: true
  validates :productivity_score, presence: true
  validates :customer_service_score, presence: true
  validates :leadership_score, presence: true
  validates :proactivity_score, presence: true
  validates :teamwork_score, presence: true
  validates :flexibility_score, presence: true
  validates :contribution_to_sales, presence: true
  validates :unjustified_absences, presence: true
  validates :warnings, presence: true
  validates :late_for_work, presence: true
end
