class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable


has_many :wikis
has_many :collaborators, dependent: :destroy

before_save { self.email = email.downcase if email.present? }
  after_initialize :set_role, :if => :new_record?

  enum role: [:standard, :premium, :admin]


  def set_role
    self.role ||= :standard
  end


         private

  def send_confirm_email
    UserMailer.new_user(self).deliver_now

  end

end
