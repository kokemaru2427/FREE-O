class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :event
  
  with_options presence: true do
    validates :family_name
    validates :last_name
    validates :j_family_name
    validates :j_last_name
    validates :entry_undergraduate
    validates :entry_school_year
    validates :entry_student_nunber
    validates :sex
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
    validates :family_name
    validates :last_name
  end

  with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :j_family_name
    validates :j_last_name 
  end

  validates :entry_student_nunber, length: { is: 10 }
  
end
