class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :team_memberships, dependent: :destroy
  has_many :teams, through: :team_memberships
  has_many :patients
  has_many :invitations, :class_name => 'Invite', :foreign_key => 'recipient_id'
  has_many :sent_invites, :class_name => 'Invite', :foreign_key => 'sender_id'
  has_many :appointments
  has_many :appointments, :class_name => 'Appointment', :foreign_key => 'assigned_user_id'
  has_many :suggested_appointments, :class_name => 'Appointment', :foreign_key => 'suggested_user_id'
end
