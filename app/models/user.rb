class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  has_many :teams_users, dependent: :destroy
  has_many :teams, through: :teams_users
  # has_one :team, as: :patient
end
