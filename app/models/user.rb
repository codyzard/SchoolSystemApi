class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # Include ActiveModel::Teacher
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  acts_as_token_authenticatable
  has_many :user_roles, dependent: :destroy
  has_many :teachers
  has_many :list_rooms
  has_many :messes
end
