class SchedulesController < ApplicationController

    # GET ALL SCHEDULES
    def index
        @schedules = DoctorSchedule.all
    
       render json: @schedules
    end

    #GET SCHEDULE DOCTOR FIND BY ID DOCTOR
    def find_schedule
        @schedules = DoctorSchedule.where("id_doctor = ?", params[:id_doctor])

        render :json => @schedules,
        status: :ok

        rescue ActiveRecord::RecordNotFound => e
        render json: {
            message: e
        }, status: :not_found
      
    end

    #ADD SCHEDULE DOCTOR
    def create
        @schedules = DoctorSchedule.new(schedule_params)

        if @schedules.save
            render json: @schedules, status: :created
        else
            render json: @schedules.errors, status: :unprocessable_entity
        end
    end

    #UPDATE
    def update
        schedule = DoctorSchedule.find(params[:id])

        schedule.update(schedule_params)

        render :json => schedule

    end

    private 
    def schedule_params
        params.permit(:id_doctor, :day, :date, :month, :year, :time_practice)
    end

end
