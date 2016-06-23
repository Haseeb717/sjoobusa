class Employee < ActiveRecord::Base
  has_many :feedbacks

  validates :cpf, presence: true
  usar_como_cpf :cpf
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  validate :cpf_unique

  def avg_commitment_score
    Feedback.where(employee_id: id)
      .group(:employee_id)
      .average(:commitment_score)[id] ||= 0
  end

  def avg_excellence_score
    Feedback.where(employee_id: id)
      .group(:employee_id)
      .average(:excellence_score)[id] ||= 0
  end

  def avg_productivity_score
    Feedback.where(employee_id: id)
      .group(:employee_id)
      .average(:productivity_score)[id] ||= 0
  end

  def avg_leadership_score
    Feedback.where(employee_id: id)
      .group(:employee_id)
      .average(:leadership_score)[id] ||= 0
  end

  def avg_proactivity_score
    Feedback.where(employee_id: id)
      .group(:employee_id)
      .average(:proactivity_score)[id] ||= 0
  end

  def avg_teamwork_score
    Feedback.where(employee_id: id)
      .group(:employee_id)
      .average(:teamwork_score)[id] ||= 0
  end

  def avg_flexibility_score
    Feedback.where(employee_id: id)
      .group(:employee_id)
      .average(:flexibility_score)[id] ||= 0
  end

  def recommendation_score
    (avg_commitment_score + avg_excellence_score + avg_productivity_score + avg_leadership_score + avg_proactivity_score + avg_teamwork_score + avg_flexibility_score) / 7
  end

  def self.recommendation_status score
    if score < 1.25
      return 'default'
    elsif score < 2.5
      return 'danger'
    elsif score < 3.75
      return 'info'
    else
      return 'success'
    end
  end

  def cpf_unique
    if self.cpf and !self.cpf.to_s.empty? and Employee.where(cpf: self.cpf).where('id <> ?', self.id || 0).first
      errors.add(:cpf, "já está cadastrado")
    end
  end
end
