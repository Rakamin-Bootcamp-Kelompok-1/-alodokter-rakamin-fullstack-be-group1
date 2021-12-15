class BookingsController < ApplicationController
    before_action :set_booking, only: [:show, :update, :destroy]

    def index
        @bookings = Booking.page(params[:page]).per(params[:per_page])

        render json: {
            data: @bookings,
            meta:{
                page: params[:page],
                # per_page: params[:per_page],
                next_page: @bookings.next_page,
                prev_page: @bookings.prev_page,
                total_page: @bookings.total_pages
            }
        },status: :ok
    end

    def show
        booking = Booking.find(params[:id])
    
        render :json => booking, status: :ok
    
      rescue ActiveRecord::RecordNotFound => e
        render json: {
            message: e
        }, status: :not_found
      end
      
    def history
      @bookings = Booking.where("user_id = ?",params[:user_id]).order("created_at DESC").page(params[:page]).per(params[:per_page])

      render json: {
            data: @bookings,
            meta:{
                page: params[:page],
                # per_page: params[:per_page],
                next_page: @bookings.next_page,
                prev_page: @bookings.prev_page,
                total_page: @bookings.total_pages
            }
      },status: :ok

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

      def create2
        @bookings = Booking.new(:message, :payment_method, :total_price, :doctor_id, :patient_id, :doctor_schedule_id)
    
        if @bookings.save
          render json: @bookings, status: :created
        else
          render json: @bookings.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /bookings/1
      def update
        if @bookings.update(bookings_params)
          render json: @bookings
        else
          render json: @bookings.errors, status: :unprocessable_entity
        end
      end
    
      # DELETE /bookings/1
      def destroy
        booking = Booking.find(params[:id])
    
        booking.destroy
    
        render json: {status:200, msg: 'Booking has been deleted.'}
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_booking
           @bookings = Booking.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def bookings_params
          params.permit(:user_id, :message, :payment_method, :total_price, :doctor_id, :patient_id, :doctor_schedule_id)
        end
end
