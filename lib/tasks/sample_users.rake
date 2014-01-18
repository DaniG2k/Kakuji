namespace :db do
  desc 'Fill database with sample users and tutors'
  task populate: :environment do
    User.create!(first_name: 'Daniele',
                last_name: 'Pestilli',
                email: 'byakugan.87@gmail.com',
                gender: 'male',
                password: 'tecredoo0',
                password_confirmation: 'tecredoo0',
                is_tutor: true)
                
    (1..100).each_with_index do |n, idx|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = "user-#{n}@gmail.com"
      password = 'foobar000'
      gender = ['male', 'female'].sample
      tutor = (idx < 50) ? true : false
      User.create!(first_name: first_name,
                  last_name: last_name,
                  email: email,
                  password: password,
                  password_confirmation: password,
                  gender: gender,
                  is_tutor: tutor)
    end
    
    50.times do |n|
      user_id = n+1
      description = 'Some random description'
      n = "%.2f" % rand(10.0..50.0)
      rate = n.to_f
      country = ['Italy', 'Mongolia', 'China', 'France', 'Korea, Republic of', 'Hong Kong', 'Japan'].sample
      Tutor.create!(user_id: user_id,
                    description: description,
                    rate: rate,
                    country: country)
    end
  end
end