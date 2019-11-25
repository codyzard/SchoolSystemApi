class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include ActiveModel::Teacher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_roles
  has_many :list_rooms
  has_many :messes
end
