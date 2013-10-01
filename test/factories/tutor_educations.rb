# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tutor_education do
    university "MyString"
    major "MyString"
    minor "MyString"
    specialization "MyString"
    tutor nil
  end
end
