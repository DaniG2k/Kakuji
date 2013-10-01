class Tutor < ActiveRecord::Base
  belongs_to :user
  has_many :educational_experiences, dependent: :destroy
  has_many :languages, class_name: "TutorLanguages", foreign_key: "tutor_id", dependent: :destroy
  
  accepts_nested_attributes_for :languages, allow_destroy: true,
    reject_if: lambda {|attr| attr[:language].blank? }
  accepts_nested_attributes_for :educational_experiences, allow_destroy: true,
    reject_if: lambda {|attr| %w(university major minor).all? { |val| attr[val].blank? }}
 
  validates_presence_of :user_id
  validates :rate, presence: true, numericality: true, format: {:with => /\A\d{1,5}(\.\d{0,2})?\z/}
  validates_length_of :description, maximum: 1000, allow_blank: false
  validate :check_educational_experiences, on: :update
  
  geocoded_by :address do |obj, results|
    if geo = results.first
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
      obj.country = geo.country
      obj.city = geo.city
      obj.postalcode = geo.postal_code
      obj.address = geo.address
    end
  end
  after_validation :geocode, if: :address_changed?
  
  private
    def is_numeric?(str)
      /\A[+-]?\d+(\.|,)?\d*\z/ === str
    end
    
    def check_educational_experiences
      educational_experiences.each do |edu|
        uni = edu.university
        maj = edu.major
        min = edu.minor
        if edu.blank? and (maj.present? or min.present?)
          errors.add(:educational_experiences_attributes, "#{I18n.t('errors.educational_experiences_attributes.no_university')}")
        elsif [uni, maj, min].any? { |str| is_numeric?(str) }
          errors.add(:educational_experiences_attributes, "#{I18n.t('errors.educational_experiences_attributes.numeric')}")
        end
      end
      if educational_experiences.size > 10
        errors.add(:educational_experiences_attributes, "#{I18n.t('errors.educational_experiences_attributes.too_many')}")
      end
    end
  # This can be used for SEO friendliness
  #def to_param
  #  "#{user.first_name}".parameterize
  #end
end