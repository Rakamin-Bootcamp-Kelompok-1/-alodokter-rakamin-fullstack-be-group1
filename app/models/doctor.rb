class Doctor < ApplicationRecord
    has_many :bookings
    has_many :patients, through: :bookings
    has_many :doctor_schedule
end
