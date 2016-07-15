10.times do
    user = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: Faker::Lorem.characters(10),
        )
    user.skip_confirmation!
    user.save!
end

(1..5).each do |num|
    test = User.new(
        name: "Test#{num}",
        email: "test#{num}@email.com",
        password: "helloworld",
        )
    test.skip_confirmation!
    test.save!
end

users = User.all

5.times do
    Patient.create!(
        name: Faker::Name.name,
        age: rand(60..100),
        address: Faker::Address.street_address,
        user: users.sample)
end

# patients = Patient.all

# patients.each do |patient|
#     Team.create!(
#         name: Faker::Lorem.sentence,
#         patient: patient
#             )
# end

teams = Team.all

teams.each do |team|
    5.times do
        Teammate.create!(
            team: team,
            user: users.sample
            )
    end
end
        


 
 
