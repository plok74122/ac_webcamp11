class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events

  ROLE = ["admin" , "partner"]

  def admin?
    if self.role == ROLE.first
      return true
    else
      return false
    end
  end
end
