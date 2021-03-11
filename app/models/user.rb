class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
         validates :password, presence: true, format: { with: VALID_PASSWORD_REGEX, message: "は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}, on: :create

         has_many :events, dependent: :destroy
         has_many :entries, dependent: :destroy
         has_many :entried_events,  source: :event, through: :entries
         has_many :comments, dependent: :destroy
         has_many :messages, dependent: :destroy
         has_many :room_users, dependent: :destroy
         has_many :favorites, dependent: :destroy
         has_one_attached :user_image
         
         has_many :relationships
         has_many :followings, through: :relationships, source: :follow
         has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
         has_many :followers, through: :reverse_of_relationships, source: :user

         has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
         has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

         def follow(other_user)
          unless self == other_user
            self.relationships.find_or_create_by(follow_id: other_user.id)
          end
        end
      
        def unfollow(other_user)
          relationship = self.relationships.find_by(follow_id: other_user.id)
          relationship.destroy if relationship
        end
      
        def following?(other_user)
          self.followings.include?(other_user)
        end

          def already_favorited?(event)
            self.favorites.exists?(event_id: event.id)
          end

          with_options presence: true do
          validates :nickname
          validates :school_year
          validates :undergraduate
          validates :student_nunber
          end
          validates :profile, length: { maximum: 250 }
          validates :student_nunber, length: { is: 10 }, uniqueness: true

          def self.guest
            find_or_create_by!(email: 'guest@example.com') do |user|
              user.password = 'Guests123'
              user.password_confirmation = user.password
              user.nickname = 'ゲストユーザー'
              user.school_year = '1回生'
              user.undergraduate = '経営学部'
              user.student_nunber = "2134567809"
              user.profile = 'ゲストユーザーです。'
            end
          end
end
