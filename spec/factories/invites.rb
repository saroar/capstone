FactoryGirl.define do
  factory :invite do
    email "MyString"
    team_id 1
    sender_id 1
    recipient_id 1
    token "MyString"
  end
end