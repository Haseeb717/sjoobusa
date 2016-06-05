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
end
