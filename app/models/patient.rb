class Patient < ApplicationRecord
    
    has_many :bookings
    has_many :doctor, through: :bookings
    belongs_to :user
end
