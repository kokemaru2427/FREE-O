class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         attachment :profile_image
         has_many :events, dependent: :destroy
         has_many :entries, dependent: :destroy
         has_many :entried_events,  source: :event, through: :entries
         has_many :comments, dependent: :destroy
         has_many :messages, dependent: :destroy
         has_many :room_users, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
         has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

          def already_favorited?(event)
            self.favorites.exists?(event_id: event.id)
          end

end
