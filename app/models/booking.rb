class Booking < ApplicationRecord
    
    belongs_to :doctor, inverse_of: :bookings
    belongs_to :patient, inverse_of: :bookings
    belongs_to :doctor_schedule, inverse_of: :bookings
    belongs_to :user
end
