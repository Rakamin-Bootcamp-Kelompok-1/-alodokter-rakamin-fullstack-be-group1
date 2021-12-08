class PatientsController < ApplicationController
    #ADD DATA PATIENT
    def create
        @patients = Patient.new(patients_params)

        if @patients.save
        render json: @patients, status: :created
        else
        render json: @patients.errors, status: :unprocessable_entity
        end
    end

    private

    def patients_params
        params.permit(:patient_name, :status, :gender, :birth_date, :age, :blood_type)
    end
end
