class V1::SymptomLogsController < ApplicationController

  def create
    symptom = Symptom.find(symptomlog_params[:symptomId])
    symptomLog = SymptomLog.new(severity: symptomlog_params[:severity], description: symptomlog_params[:description], uploadedFiles: symptomlog_params[:uploadedFiles])
    symptomLog.symptom_id = symptom.id
    symptomLog.save
    redirect_to v1_symptom_path(symptom)
  end

  private

  def symptomlog_params
    params.require(:symptomData).permit(:symptomId, :severity, :description, uploadedFiles: [:fileName, :url, :publicID])
  end
end
