class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :registerable, :recoverable, :rememberable, :validatable, :trackable and :omniauthable
  devise :database_authenticatable, :validatable
end
