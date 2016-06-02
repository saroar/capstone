# 10.times do
#     user = User.new(
#         name: Faker::Name.name,
#         email: Faker::Internet.email,
#         password: Faker::Lorem.characters(10),
#         )
#     user.skip_confirmation!
#     user.save!
# end

# (1..5).each do |num|
#     test = User.new(
#         name: "Test#{num}",
#         email: "test#{num}@email.com",
#         password: "helloworld",
#         )
#     test.skip_confirmation!
#     test.save!
# end

# users = User.all

# 10.times do
#     Team.create!(
#         title: Faker::Lorem.sentence,
#         body: Faker::Lorem.paragraph,
#         user: users.sample,
#             )
#  end
 
#  10.times do
#     Wiki.create!(
#         title: Faker::Lorem.sentence,
#         body: Faker::Lorem.paragraph,
#         user: premium_users.sample,
#         private: true
#             )
#  end
 
#  wikis = Wiki.all
 
#  30.times do
#      Collaborator.create!(
#          user_id: users.sample.id,
#          wiki_id: wikis.sample.id
#          )
#      end
     
# Subscription.create!(user_id: 1, customer_id: "cus_00000000000000")