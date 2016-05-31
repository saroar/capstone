class Caretaker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :patientcaretakers, dependent: :destroy
  has_many :patients, through: :patientcaretakers
end
