class ActivitiesCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '趣味・娯楽のメンバー募集' },
    { id: 3, name: '新入生歓迎' },
    { id: 4, name: 'ボランティア活動' },
    { id: 5, name: '新規プロジェクト立ち上げ' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :events
  
  end