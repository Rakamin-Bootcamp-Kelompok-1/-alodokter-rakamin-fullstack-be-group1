class DoctorSchedule < ApplicationRecord
    paginates_per 10
    belongs_to :doctor, inverse_of: :bookings
    has_many :bookings
end
