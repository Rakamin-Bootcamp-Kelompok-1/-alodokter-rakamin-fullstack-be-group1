class PatientsController < ApplicationController

    def index
        @patients = Patient.all
    
        render json: @patients
      end
    
      # GET /patients/1
      def show
        patient = Patient.find(params[:id])
    
        render :json => patient, status: :ok
    
      rescue ActiveRecord::RecordNotFound => e
        render json: {
            message: e
        }, status: :not_found
      end
    
      # POST /patients
      
      def create
        patient = Patient.create(patients_params)
    
        render json: {
            data: patient
        }, status: :created
    
      rescue StandardError => e
        render json: {
            message: e
        }, status: :bad_request
      end
    
      # PATCH/PUT /patients/1
      def update
        patient = Patient.find(params[:id])
    
        patient.update(patients_params)
    
        render :json => patient
      end
    
      # DELETE /patients/1
      def destroy
        patient = Patient.find(params[:id])
    
        patient.destroy
    
        render :json => {}, status: :ok
      end
    
      private
        # Only allow a list of trusted parameters through.
        def patients_params
          params.permit(:patient_name, :status, :gender, :birth_date, :blood_type, :age)
        end

end
