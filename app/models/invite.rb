class Invite < ActiveRecord::Base
    belongs_to :team
    belongs_to :sender, :class_name => 'User'
    belongs_to :recipient, :class_name => 'User'
    before_save :check_user_existence
    validates :email, :presence => true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :sender_id, :presence => true
    validates :team_id, :presence => true

    def check_user_existence
        recipient = User.find_by_email(email)
        if recipient
            self.recipient_id = recipient.id
        end
    end
    
    before_create :generate_token
    
    private
    
    def generate_token
        self.token = Digest::SHA1.hexdigest([self.team_id, Time.now, rand].join)
    end
end
