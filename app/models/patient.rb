class Patient < ApplicationRecord
    has_many :bookings
    has_many :doctor, through: :bookings
end
