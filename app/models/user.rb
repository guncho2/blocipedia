class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

has_many :wikis, dependent: :destroy
         private

  def send_confirm_email
    UserMailer.new_user(self).deliver_now

  end

end
