# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tutor_language, :class => 'TutorLanguages' do
    language "MyString"
    proficiency "MyString"
  end
end
