class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :update, :destroy]

    def index
        @bookings = Booking.all
    
        render json: @bookings
    end

    def show
        booking = Booking.find(params[:id])
    
        render :json => booking, status: :ok
    
      rescue ActiveRecord::RecordNotFound => e
        render json: {
            message: e
        }, status: :not_found
      end
    
      # POST /bookings
      def create
        @bookings = Booking.new(bookings_params)
    
        if @bookings.save
          render json: @bookings, status: :created
        else
          render json: @bookings.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /bookings/1
      def update
        booking = Booking.find(params[:id])
    
        booking.update(bookings_params)
    
        render :json => booking
      end
    
      # DELETE /bookings/1
      def destroy
        booking = Booking.find(params[:id])
    
        booking.destroy
    
        render :json => {}, status: :ok
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_booking
          @bookings = Booking.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def bookings_params
          params.permit(:message, :payment_method, :total_price, :doctor_id, :patient_id)
        end
end
