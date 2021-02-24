class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         attachment :profile_image
         has_many :events, dependent: :destroy
         has_many :entried_events, class_name: 'Event', through: :entries
         has_many :comments, dependent: :destroy
         has_many :entries, dependent: :destroy

end
