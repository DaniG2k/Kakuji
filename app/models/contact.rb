class Contact
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::Conversion
  include ActiveModel::Validations
  
  attr_accessor :name, :email, :body, :malicious
  
  validates_presence_of :name, :email, :body
  validates_absence_of :malicious # Used for catching spam bots
  validates :email, format: { with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/ }
  validates :body, length: { minimum: 10, maximum: 1000 }
  
  def initialize(attributes = {})
    attributes.each {|name, val| send("#{name}=", val)}
  end
  
  # Required for some of the form helpers.
  # We’re not storing anything in the database so we just return false.
  # If you omit this method you will get an undefined
  # method ‘persisted?’ error when trying to use the form_tag helper.
  def persisted?
    false
  end
end