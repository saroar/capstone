class Patient < ActiveRecord::Base
    has_one :team
    has_many :teammates, through: :team
    has_many :users, through: :teammates
    belongs_to :account, class_name: "User", foreign_key: "user_id"
end