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
  validates :leadership_score, presence: true
  validates :proactivity_score, presence: true
  validates :teamwork_score, presence: true
  validates :flexibility_score, presence: true
  validates :contribution_to_sales, presence: true
  validates :unjustified_absences, presence: true
  validates :warnings, presence: true
  validates :late_for_work, presence: true

  validate :end_after_start
  validate :end_after_today

  def commitment_score_percentage
    commitment_score * 20
  end

  def excellence_score_percentage
    excellence_score * 20
  end

  def productivity_score_percentage
    productivity_score * 20
  end

  def leadership_score_percentage
    leadership_score * 20
  end

  def proactivity_score_percentage
    proactivity_score * 20
  end

  def teamwork_score_percentage
    teamwork_score * 20
  end

  def flexibility_score_percentage
    flexibility_score * 20
  end

  private
    def end_after_start
      return if end_at.blank? || start_at.blank?

      if end_at < start_at
        errors.add(:end_at, "não pode ser anterior a data inicial")
      end
    end

    def end_after_today
      return if end_at.blank?

      if end_at > Date.today
        errors.add(:end_at, "não pode ser posterior a data de hoje")
      end
    end
end
