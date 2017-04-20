class V1::PrescriptionsController < ApplicationController

  def create
    account = @current_account
    newPrescription = Prescription.new(prescription_params)
    newPrescription.account_id = account.id
    newSchedule = Schedule.new(schedule_params)
    newSchedule.prescription_id = newPrescription.id
    newSchedule.save
    newPrescription.save
  end


  private
  def prescription_params
    params.require(:prescriptionData).require(:prescription).permit(:name,:instructions, :dosage, :units, :quantity, :refills, :doctor)
  end
  def schedule_params
    params.require(:prescriptionData).require(:schedule).permit(:start_date, :end_date,:expiration_date, :frequency, :hours => [], :weekdays => [], :month_days => [])
  end
end
