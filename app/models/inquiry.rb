class Inquiry
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  attr_accessor :name, :email, :message
  
  validates_presence_of :name, :email, :message
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
  validates :message, length: { minimum: 10, maximum: 1000 }
  
  def initialize(attributes = {})
    attributes.each do |name, val|
      send("#{name}=", val)
    end
  end
  
  def deliver
   return false unless valid?
   true
  end
  
  def persisted?
    false
  end
end