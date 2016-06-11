class Company < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  validates :cnpj, presence: true
  usar_como_cnpj :cnpj
  validates :name, presence: true
  validates :trade, presence: true

  validate :cnpj_unique

  def cnpj_unique
    if self.cnpj and !self.cnpj.to_s.empty? and Company.where(cnpj: self.cnpj).where('id <> ?', self.id || 0).first
      errors.add(:cnpj, "já está cadastrado")
    end
  end
end
