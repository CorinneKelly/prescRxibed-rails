
class V1::SymptomsController < ApplicationController
  
  def index
# moved api call request to prescription show page
    @symptoms = prescription.symptoms
    render json: @symptoms

  end

  def create
    prescription = Prescription.find(symptom_params[:prescriptionId])

    newsymptom = Symptom.create(name: symptom_params[:name])
    newsymptom.prescription_id = prescription.id
    newsymptom.save

    newsymptomLog = SymptomLog.new(severity: symptom_params[:severity], description: symptom_params[:description], uploadedFiles: symptom_params[:uploadedFiles])
    newsymptomLog.symptom_id = newsymptom.id
    newsymptomLog.save

    byebug
  end

  def show
    byebug
    symptom = Symptom.find_by(id: params[:id])
    render json: symptom
  end


  private
  def symptom_params
    params.require(:symptomData).permit(:name, :severity, :description, :prescriptionId, uploadedFiles: [:fileName, :url, :publicID]) #should also include array of image ids
  end

end
