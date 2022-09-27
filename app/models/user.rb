class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  #has_many :blogs, dependent: :destory
  has_many :blogs, dependent: :destroy_async
  has_many :comments, dependent: :destroy_async

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
