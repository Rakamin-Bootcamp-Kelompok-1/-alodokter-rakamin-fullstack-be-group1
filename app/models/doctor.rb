class Doctor < ApplicationRecord
    paginates_per 10


    has_many :bookings
    has_many :patients, through: :bookings
    has_many :doctor_schedule
end
