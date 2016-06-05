class Employee < ActiveRecord::Base
  has_many :feedbacks

  validates :cpf, presence: true
  usar_como_cpf :cpf
  validates :name, presence: true
  validates :email, presence: true
end
