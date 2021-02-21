class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'スポーツ・運動' },
    { id: 3, name: '講演会' },
    { id: 4, name: 'ボランティア' },
    { id: 5, name: '音楽・コンサート' },
    { id: 6, name: 'おしゃべり会' },
    { id: 7, name: '趣味・娯楽' },
    { id: 8, name: '勉強' },
    { id: 9, name: 'パーティー・祭り・宴会' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :events
  
  end