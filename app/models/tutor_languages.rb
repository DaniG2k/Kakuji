class TutorLanguages < ActiveRecord::Base
  belongs_to :tutor
  validates_numericality_of :proficiency, greater_than: 0, less_than: 5, only_integer: true
end
