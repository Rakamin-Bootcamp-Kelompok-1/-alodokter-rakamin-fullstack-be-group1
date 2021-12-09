class DoctorSchedule < ApplicationRecord
    belongs_to :doctor, inverse_of: :bookings

    has_many :bookings
end
