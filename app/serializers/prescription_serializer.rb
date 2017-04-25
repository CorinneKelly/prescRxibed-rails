class PrescriptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :dosage, :instructions, :quantity, :units, :refills, :doctor


end
