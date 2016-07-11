class Company < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_attached_file :bill_document
  validates_attachment :bill_document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

  has_attached_file :cnpj_document
  validates_attachment :cnpj_document, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}

  validates :cnpj, presence: true
  usar_como_cnpj :cnpj
  validates :name, presence: true
  validates :trade, presence: true

  validate :cnpj_unique
  after_save :send_verification_email, :if => proc { |l| l.confirmed_at_changed? && l.confirmed_at_was.nil? }
  
  def cnpj_unique
    if self.cnpj and !self.cnpj.to_s.empty? and Company.where(cnpj: self.cnpj).where('id <> ?', self.id || 0).first
      errors.add(:cnpj, "já está cadastrado")
    end
  end

  def send_verification_email
    subject = "Verificação empresas sjoobs"
    VerifyCompany.send_verification_email(self,subject).deliver
  end
end
