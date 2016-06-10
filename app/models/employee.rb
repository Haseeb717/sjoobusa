class Employee < ActiveRecord::Base
  has_many :feedbacks

  validates :cpf, presence: true
  usar_como_cpf :cpf
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  validate :cpf_unique

  def cpf_unique
    if self.cpf and !self.cpf.to_s.empty? and Employee.where(cpf: self.cpf).where('id <> ?', self.id || 0).first
      errors.add(:cpf, "já está cadastrado")
    end
  end
end
