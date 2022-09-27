class Blog < ApplicationRecord
    belongs_to :user

    #has_many :comments, dependent: :destory
    has_many :comments, dependent: :destroy_async
  end