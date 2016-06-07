class Patient < ActiveRecord::Base
    has_one :team
    belongs_to :user
end