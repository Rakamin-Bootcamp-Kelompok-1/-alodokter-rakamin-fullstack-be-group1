class Patient < ApplicationRecord
    paginates_per 10
    has_many :bookings
    has_many :doctor, through: :bookings
    belongs_to :user
end
