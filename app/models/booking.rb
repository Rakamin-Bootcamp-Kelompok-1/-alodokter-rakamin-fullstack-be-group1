class Booking < ApplicationRecord
     paginates_per 10
    
    belongs_to :doctor, inverse_of: :bookings
    belongs_to :patient, inverse_of: :bookings
    belongs_to :doctor_schedule, inverse_of: :bookings
    belongs_to :user
end
