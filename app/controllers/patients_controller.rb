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

      def list_patient
        @patients = Patient.where("user_id = ?",params[:user_id]).page(params[:page])

        render json: {
            data: @patients,
            meta:{
                page: params[:page],
                per_page: params[:per_page],
                next_page: @patients.next_page,
                prev_page: @patients.prev_page,
                total_page: @patients.total_pages
            }
        },status: :ok

        rescue ActiveRecord::RecordNotFound => e
        render json: {
            message: e
        }, status: :not_found
      end
    
      # POST /patients
      
      def create
        @patients = Patient.create(patients_params)
    
          if @patients.save
               render json: @patients, status: :created
          else
               render json: @patients.errors, status: :unprocessable_entity
          end
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
    
        render json: {status:200, msg: 'Data patient has been deleted.'}
      end
    
      private
      def set_patients
        @patient = Patient.find(params[:id])
      end
  
        # Only allow a list of trusted parameters through.
      def patients_params
        params.permit(:user_id, :patient_name, :status, :gender, :birth_date, :blood_type, :age)
      end
end
