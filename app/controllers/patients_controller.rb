class PatientsController < ApplicationController
  before_filter :disable_sidebar, only: [:index]
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :send_threshold_email
  layout 'application', :except => [:index]
  # GET /patients
  # GET /patients.json
  def disable_sidebar 
    @disable_sidebar = true
  end
  def search
    index
    render :index
  end
  
  def index
    @patients = Patient.all
    @search = Patient.search(params[:q])
    @patients = @search.result
    
  end

  # GET /patients/1
  # GET /patients/1.json
  def show
    @patient = Patient.find(params[:id])
  end

  # GET /patients/new
  def new
    @patient = Patient.new
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render action: 'show', status: :created, location: @patient }
      else
        format.html { render action: 'new' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)

          format.html { redirect_to @patient, notice: 'Patient was successfully updated.' }
          format.json { head :no_content }



      else
        format.html { render action: 'edit' }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url }
      format.json { head :no_content }
    end
  end

  def data
      @mode = params[:mode]
      
      @data = PatientData.where(:patient_id => params[:patient_id]).order(transmission_time: :asc).limit(96)

      if(@mode == "1 week")
        @data = PatientData.where(:patient_id => params[:patient_id]).order(transmission_time: :asc).limit(672)
      end
      
      respond_to do |format|
        format.json { render json: @data}
      end
  end


def send_threshold_email
  #if Patient.vitalThreshold > @patient_data.spo2
  #@curPat = Patient.find(params[:id])
  #@curPat = Patient.find_by :patient_id 1
  #@curData = PatientData.find(params[:id])
  #@curData = PatientData.where(:patient_id => params[:patient_id])
  #@user = User.find_by :id 1
  #@currentID = 1
  #@curData = PatientData.find_by :patient_id @currentID
  #if @curData.spo2 < @curPat.vitalThreshold
    #ThresholdMailer.notification_email(current_user.email).deliver 
    #redirect_to :controller => 'patient', :action => 'show', :notice => 'Patient spo2 values are low!' 
  #end

end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:name, :email, :phone, :condition, :deviceId, :vitalThreshold)
    end

    
end
